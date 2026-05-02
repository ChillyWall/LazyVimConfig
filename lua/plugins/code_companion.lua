return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = {
        chat = {
          adapter = "opencode",
          model = "Github Copilot/GPT-5.2-Codex",
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
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function(_, opts)
      require("codecompanion").setup(opts)
      vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
      vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
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
