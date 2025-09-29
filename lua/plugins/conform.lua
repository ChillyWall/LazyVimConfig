return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["c"] = { "clang_format" },
      ["cpp"] = { "clang_format" },
      ["arduino"] = { "clang_format" },
      ["tex"] = { "latexindent" },
      ["cmake"] = { "gersemi" },
      ["zsh"] = { "beautysh" },
      ["json"] = { "biome" },
    },
    formatters = {
      clang_format = {
        prepend_args = {
          "--assume-filename",
          "--style=file",
        },
      },
    },
  },
}
