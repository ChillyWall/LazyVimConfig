return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders=true",
          "--fallback-style=llvm",
          "--query-driver=/usr/bin/g++",
        },
        root_dir = function(bufnr, ondir)
          local root_directory = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
          end
          if type(bufnr) == "string" then
            return root_directory(bufnr)
          else
            local fname = vim.api.nvim_buf_get_name(bufnr)
            ondir(root_directory(fname))
          end
        end,
      },
    },
  },
}
