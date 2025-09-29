--- Wraps the visual selection with a user-provided tag.
local function wrap_with_tag(tag)
  local mode = vim.fn.mode()
  -- Ensure we are in visual mode
  if not (mode == "v" or mode == "V" or mode == "\22") then
    return
  end

  -- Get the start and end positions using 'v' and '.' marks.
  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")

  local s_row, s_col = start_pos[2] - 1, start_pos[3] - 1
  local e_row, e_col = end_pos[2] - 1, end_pos[3]

  -- Swap coordinates if selected backwards
  if s_row > e_row or (s_row == e_row and s_col > e_col) then
    s_row, e_row = e_row, s_row
    s_col, e_col = e_col, s_col
  end

  -- Get the visually selected lines
  local lines = vim.api.nvim_buf_get_lines(0, s_row, e_row + 1, false)

  -- Handle partial line selections
  if #lines > 0 then
    -- If multiline, adjust columns
    if #lines > 1 then
      lines[1] = string.sub(lines[1], s_col + 1)
      lines[#lines] = string.sub(lines[#lines], 1, e_col)
    else -- If single line
      lines[1] = string.sub(lines[1], s_col + 1, e_col)
    end
  end

  local selection_text = table.concat(lines, "\n")

  -- Get the tag name from user input
  if tag == nil or tag == "" then
    return -- Abort if no tag is entered
  end

  -- Construct the new wrapped text
  local new_text = { "\\" .. tag .. "{" .. selection_text .. "}" }

  -- Replace the text in the current buffer (0)
  vim.api.nvim_buf_set_text(0, s_row, s_col, e_row, e_col, new_text)
  vim.cmd("normal! u")
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex" },
  callback = function()
    local keymap = vim.keymap
    keymap.set("v", "<localleader>sb", function()
      wrap_with_tag("symbf")
    end, { desc = "\\symbf" })
    keymap.set("v", "<localleader>si", function()
      wrap_with_tag("symit")
    end, { desc = "\\symit" })
    keymap.set("v", "<localleader>su", function()
      wrap_with_tag("symup")
    end, { desc = "\\symup" })
    keymap.set("v", "<localleader>sm", function()
      wrap_with_tag("symbfit")
    end, { desc = "\\symbfit" })
    keymap.set("v", "<localleader>st", function()
      wrap_with_tag("tilde")
    end, { desc = "\\tilde" })
    keymap.set("v", "<localleader>sh", function()
      wrap_with_tag("hat")
    end, { desc = "\\hat" })
    keymap.set("v", "<localleader>sa", function()
      wrap_with_tag("bar")
    end, { desc = "\\bar" })
    keymap.set("v", "<localleader>s", "", { desc = "wrap with command" })
  end,
})

return {}
