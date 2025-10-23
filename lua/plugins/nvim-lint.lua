return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = {
          "--config",
          "~/.markdownlint-cli2.yaml",
          "--",
        },
      },
      markdownlint = {
        args = {
          "--config",
          "~/.markdownlint.yaml",
          "--",
        },
      },
    },
  },
}
