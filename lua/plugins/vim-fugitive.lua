local wk = require("which-key")
wk.add({
  { "<leader>gb", group = "branch" },
  { "<leader>gr", group = "re-" },
  { "<leader>gp", group = "pull/push" },
})
return {
  "tpope/vim-fugitive",
  lazy = true,
  keys = {
    { "<leader>gbm", ":G merge<SPACE>", desc = "merge" },
    { "<leader>gbc", ":G checkout<SPACE>", desc = "checkout to branch" },

    { "<leader>grs", ":G reset<SPACE>", desc = "reset" },
    { "<leader>grb", ":G rebase<SPACE>", desc = "rebase" },
    { "<leader>grv", ":G revert<SPACE>", desc = "revert" },
    { "<leader>grf", ":G reflog<CR>", desc = "reflog" },
    { "<leader>grm", ":G remote<SPACE>", desc = "remote" },

    { "<leader>ga", ":G add<SPACE>", desc = "add" },
    { "<leader>gC", ":G commit -m<SPACE>", desc = "commit with message" },

    { "<leader>gpl", ":G pull<SPACE>", desc = "pull" },
    { "<leader>gps", ":G push<SPACE>", desc = "push" },
  },
}
