return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["c"] = { "clang_format" },
      ["c++"] = { "clang_format" },
      ["cpp"] = { "clang_format" },
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
