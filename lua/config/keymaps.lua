-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap

-- use jj to quit insert mode
keymap.set("i", "jj", "<Esc>", opts)

-- use Ctrl + h/l to move cursor to left or right in insert mode
keymap.set("i", "<C-b>", "<Left>", opts)
keymap.set("i", "<C-f>", "<Right>", opts)
keymap.set("i", "<C-h>", "<Left>", opts)
keymap.set("i", "<C-l>", "<Right>", opts)
keymap.set("i", "<C-n>", "<Down>", opts)
keymap.set("i", "<C-p>", "<Up>", opts)

-- use enter to add a line and move to it in normal mode
keymap.set("n", "<C-CR>", "o<Esc>", opts)
-- use <S-Enter> to add a line before and move to it in normal mode
keymap.set("n", "<S-Enter>", "O<Esc>", opts)

-- use space to add a space before cursor
keymap.set("n", "<Space>", "i<Space><Esc>l", opts)

keymap.set("n", "<leader>wL", "<C-w>L", opts)
keymap.set("n", "<leader>wK", "<C-w>K", opts)
keymap.set("n", "<leader>wJ", "<C-w>J", opts)
keymap.set("n", "<leader>wH", "<C-w>H", opts)

keymap.set("n", "<leader>nh", ":nohlsearch<CR>", opts)

if not vim.g.vscode then
  -- use leader to open terminals
  local wk = require("which-key")
  wk.add({
    -- terminals
    { "<leader>t", group = "test/terminal" },
    { "<leader>tv", group = "Vertical Terminals" },

    { "<leader>wL", desc = "move current window to right" },
    { "<leader>wH", desc = "move current window to left" },
    { "<leader>wJ", desc = "move current window to buttom" },
    { "<leader>wK", desc = "move current window to up" },

    -- others
    { "<leader>n", group = "cancel" },
    { "<leader>nh", desc = "no highlight search" },
    {
      "<leader>ns",
      function()
        require("luasnip").unlink_current()
      end,
      desc = "unlink current snippet",
    },

    { "<leader>o", group = "open/overseer" },

    -- shells
    { "<leader>tc", ":rightbelow term cmd<CR>", desc = "open cmd below", mode = "n" },
    { "<leader>tp", ":rightbelow term pwsh<CR>", desc = "open powershell below" },
    { "<leader>tC", ":vert rightbelow term cmd<CR>", desc = "open cmd right" },
    { "<leader>tP", ":vert rightbelow term pwsh<CR>", desc = "open powershell right" },

    { "<leader>tb", ":rightbelow term bash<CR>", desc = "open bash below", mode = "n" },
    { "<leader>tz", ":rightbelow term zsh<CR>", desc = "open zsh below", mode = "n" },
    { "<leader>tf", ":rightbelow term fish<CR>", desc = "open fish below", mode = "n" },
    { "<leader>tB", ":vert rightbelow term bash<CR>", desc = "open bash right", mode = "n" },
    { "<leader>tZ", ":vert rightbelow term zsh<CR>", desc = "open zsh right", mode = "n" },
    { "<leader>tF", ":vert rightbelow term fish<CR>", desc = "open fish right", mode = "n" },
  })
else
  keymap.set("n", "<leader>e", [[<cmd>lua require('vscode').action('workbench.explorer.fileView.focus')<cr>]])
  keymap.set("n", "<leader>t", [[<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<cr>]])
  keymap.set(
    "n",
    "<leader>cp",
    [[<cmd>lua require('vscode').action('markdown-preview-enhanced.openPreviewToTheSide')<cr>]]
  )
  keymap.set("n", "<leader>cf", [[<cmd>lua require('vscode').action('editor.action.formatDocument')<cr>]])
  keymap.set("n", "<leader>wv", [[<cmd>lua require('vscode').action('workbench.action.splitEditor')<cr>]])
  keymap.set("n", "<leader>ws", [[<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<cr>]])
end
