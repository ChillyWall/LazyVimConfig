return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        cmd = {
          vim.fn.exepath("clangd-22") or "clangd-22",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders=true",
          "--fallback-style=llvm",
          "--experimental-modules-support",
        },
      },
    },
  },
}
