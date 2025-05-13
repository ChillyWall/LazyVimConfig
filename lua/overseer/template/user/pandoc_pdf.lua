return {
  name = "convert markdown to pdf with pandoc",
  builder = function()
    local file = vim.fn.expand("%:p")
    local output_file = vim.fn.expand("%:r") .. ".pdf"
    return {
      cmd = { "pandoc" },
      args = {
        file,
        "--to=pdf",
        "--pdf-engine=lualatex",
        "--template=eisvogel.latex",
        "--standalone",
        "-o",
        output_file,
      },
      components = { { "on_output_quickfix", open = false }, "default" },
    }
  end,
  condition = {
    filetype = {
      "markdown",
    },
  },
}
