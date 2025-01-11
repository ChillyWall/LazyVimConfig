return {
  "kiyoon/jupynium.nvim",
  build = "conda run --no-capture-output -n jupynium pip install .",
  enabled = vim.fn.isdirectory(vim.fn.expand("~/miniconda3/envs/jupynium")),
  opts = {
    python_host = { "conda", "run", "--no-capture-output", "-n", "jupynium", "python" },
  },
}
