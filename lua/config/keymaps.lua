-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = {
  noremap = true,
  silent = true,
}

-- use jj to quit insert mode
vim.keymap.set("i", "jj", "<Esc>", opts)

-- use Ctrl + h/l to move cursor to left or right in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)

-- use enter to add a line and move to it in normal mode
vim.keymap.set("n", "<CR>", "o<Esc>", opts)
-- use <S-Enter> to add a line before and move to it in normal mode
vim.keymap.set("n", "<S-Enter>", "O<Esc>", opts)

-- use space to add a space before cursor
vim.keymap.set("n", "<Space>", "i<Space><Esc>l", opts)

if not vim.g.vscode then
  -- use leader to open terminals
  local wk = require("which-key")
  wk.add({
    -- terminals
    { "<leader>tv", group = "Vertical Terminals" },

    { "<leader>wL", desc = "move current window to right" },
    { "<leader>wH", desc = "move current window to left" },
    { "<leader>wJ", desc = "move current window to buttom" },
    { "<leader>wK", desc = "move current window to up" },

    -- others
    { "<leader>n", group = "cancel" },
    { "<leader>nh", ":nohlsearch<CR>", desc = "no highlight search" },
    {
      "<leader>ns",
      function()
        require("luasnip").unlink_current()
      end,
      desc = "unlink current snippet",
    },
  })

  if vim.fn.has("win") then
    wk.add({
      { "<leader>tc", ":rightbelow term cmd<CR>", desc = "open cmd below", mode = "n" },
      { "<leader>tp", ":rightbelow term pwsh<CR>", desc = "open powershell below" },
      { "<leader>tvc", ":vert rightbelow term cmd<CR>", desc = "open cmd right" },
      { "<leader>tvp", ":vert rightbelow term pwsh<CR>", desc = "open powershell right" },
    })
  end

  if vim.fn.has("unix") then
    wk.add({
      { "<leader>tb", ":rightbelow term bash<CR>", desc = "open bash below", mode = "n" },
      { "<leader>tz", ":rightbelow term zsh<CR>", desc = "open zsh below" },
      { "<leader>tvb", ":vert rightbelow term bash<CR>", desc = "open bash right" },
      { "<leader>tvz", ":vert rightbelow term zsh<CR>", desc = "open zsh right" },
    })
  end
end
