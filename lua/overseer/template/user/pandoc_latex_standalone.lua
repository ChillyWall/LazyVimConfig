return {
  name = "convert markdown to latex standalone with pandoc",
  builder = function()
    local path = vim.fn.expand("%:p:h")
    local file = vim.fn.expand("%:t")
    local output_file = vim.fn.expand("%:t:r") .. ".tex"
    return {
      cmd = { "pandoc" },
      args = {
        file,
        "--to=latex",
        "--template=eisvogel.latex",
        "--standalone",
        "-F",
        "pandoc-crossref",
        "-L",
        "diagram.lua",
        "-L",
        "table-rules.lua",
        "--number-sections",
        "--extract-media=.",
        "-o",
        output_file,
      },
      cwd = path,
      components = { { "on_output_quickfix", open = true, close = true }, "default" },
    }
  end,
  condition = {
    filetype = {
      "markdown",
    },
  },
}
