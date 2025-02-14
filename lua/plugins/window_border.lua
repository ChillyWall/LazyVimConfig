return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
          winhighlight = "Search:None,Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine",
        },
        documentation = {
          window = {
            border = "rounded",
            winhighlight = "FloatBorder:FloatBorder,Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
