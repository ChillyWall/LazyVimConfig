return {
  "mdrokz/music.nvim",
  build = "sh ./install.sh",
  keys = {
    { "<leader>om", [[<cmd>lua music.open_fw()<cr>]], desc = "open music" },
  },
}
