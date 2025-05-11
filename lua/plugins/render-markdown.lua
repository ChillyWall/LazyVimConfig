return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    latex = {
      enabled = false,
    },
    checkbox = {
      enabled = true,
      render_modes = false,
      right_pad = 1,
      unchecked = {
        icon = "󰄱 ",
        highlight = "RenderMarkdownUnchecked",
        scope_highlight = nil,
      },
      checked = {
        icon = "󰱒 ",
        highlight = "RenderMarkdownChecked",
        scope_highlight = nil,
      },
      custom = {
        uncertain = { raw = "[?]", rendered = "", highlight = "RenderMarkdownSuccess", scope_highlight = nil },
        repeated = { raw = "[+]", rendered = "󰑖", highlight = "RenderMarkdownInfo", scope_highlight = nil },
        urgent = { raw = "[!]", rendered = "", highlight = "RenderMarkdownError", scope_highlight = nil },
      },
    },
  },
}
