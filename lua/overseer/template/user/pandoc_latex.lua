return {
  name = "convert to latex file with pandoc",
  builder = function()
    local file = vim.fn.expand("%:p")
    local output_file = vim.fn.expand("%:r") .. ".tex"
    return {
      cmd = { "pandoc" },
      args = { file, "-t", "latex", "-s", "-o", output_file },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = {
      "markdown",
    },
  },
}
