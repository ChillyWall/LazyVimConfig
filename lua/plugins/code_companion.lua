return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = {
        chat = {
          adapter = "opencode",
          model = "Github Copilot/GPT-5.4-Mini",
        },
        inline = {
          adapter = "ollama",
          model = "qwen2.5-coder:7b",
        },
        cmd = {
          adapter = "ollama",
          model = "qwen2.5-coder:7b",
        },
      },
      display = {
        diff = {
          enabled = true,
          threshold_for_chat = 15,
          window = {
            width = function()
              return math.min(120, vim.o.columns - 10)
            end,
            height = function()
              return vim.o.lines - 4
            end,
            opts = {
              number = true,
            },
          },
          word_highlights = {
            additions = true,
            deletions = true,
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function(_, opts)
      require("codecompanion").setup(opts)
      vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
      vim.keymap.set(
        { "n", "v" },
        "<LocalLeader>a",
        "<cmd>CodeCompanionChat Toggle<cr>",
        { noremap = true, silent = true }
      )
      vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },
}
