return {
  name = "draw mermaid with mmdc",
  builder = function()
    local path = vim.fn.expand("%:p:h")
    local file = vim.fn.expand("%:t")
    local output_file = vim.fn.expand("%:t:r") .. ".png"
    return {
      cmd = { "mmdc" },
      args = {
        "-i",
        file,
        "-e",
        "png",
        "-p",
        "/home/chilly/puppeteer-config.json",
        "--width=2560",
        "--height=1600",
        "-o",
        output_file,
      },
      cwd = path,
      components = { { "on_output_quickfix", open = true, close = true }, "default" },
    }
  end,
  condition = {
    filetype = {
      "mermaid",
    },
  },
}
