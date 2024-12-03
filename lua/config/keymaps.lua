-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = {
    noremap = true,
    silent = true,
}

-- use jj to quit insert mode
vim.keymap.set("i", "jj", "<Esc>", opts)

-- use Ctrl + h/l to move cursor to left or right in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)

-- use enter to add a line and move to it in normal mode
vim.keymap.set("n", "<CR>", "o<Esc>", opts)
-- use <S-Enter> to add a line before and move to it in normal mode
vim.keymap.set("n", "<S-Enter>", "O<Esc>", opts)

-- use space to add a space before cursor
vim.keymap.set("n", "<Space>", "i<Space><Esc>l", opts)

-- use leader to open terminals
local wk = require("which-key")
wk.add({
    -- terminals
    { "<leader>tb", ":rightbelow term bash<CR>", desc = "open bash below", mode = "n" },
    { "<leader>tz", ":rightbelow term zsh<CR>", desc = "open zsh below" },
    { "<leader>tv", group = "Vertical Terminals" },
    { "<leader>tvb", ":vert rightbelow term bash<CR>", desc = "open bash right" },
    { "<leader>tvz", ":vert rightbelow term zsh<CR>", desc = "open zsh right" },

    -- git
    { "<leader>gb", group = "branch" },
    { "<leader>gbm", ":G merge<SPACE>", desc = "merge" },
    { "<leader>gbc", ":G checkout<SPACE>", desc = "checkout to branch" },

    { "<leader>gr", group = "re-" },
    { "<leader>grs", ":G reset<SPACE>", desc = "reset" },
    { "<leader>grb", ":G rebase<SPACE>", desc = "rebase" },
    { "<leader>grv", ":G revert<SPACE>", desc = "revert" },
    { "<leader>grf", ":G reflog<CR>", desc = "reflog" },
    { "<leader>grm", ":G remote<SPACE>", desc = "remote" },

    { "<leader>ga", ":G add<SPACE>", desc = "add" },
    { "<leader>gC", ":G commit -m<SPACE>", desc = "commit with message" },

    { "<leader>gp", group = "pull/push" },
    { "<leader>gpl", ":G pull<SPACE>", desc = "pull" },
    { "<leader>gps", ":G push<SPACE>", desc = "push" },

    -- cmake
    { "<leader>m", group = "CMake" },
    { "<leader>mg", ":CMakeGenerate<CR>", desc = "cmake generate" },
    { "<leader>mb", ":CMakeBuild<CR>", desc = "cmake build" },
    { "<leader>md", ":CMakeDebug<CR>", desc = "cmake debug" },
    { "<leader>mr", ":CMakeRun<CR>", desc = "cmake run" },
    { "<leader>mc", ":CMakeClean<CR>", desc = "cmake clean" },
    { "<leader>mi", ":CMakeInstall<CR>", desc = "cmake install" },

    { "<leader>ms", group = "Select"},
    { "<leader>msb", group = "Build"},
    { "<leader>msbt", ":CMakeSelectBuildType<CR>", desc = "type" },
    { "<leader>msbd", ":CMakeSelectBuildDir<CR>", desc = "dir" },
    { "<leader>msbg", ":CMakeSelectBuildTarget<CR>", desc = "target" },
    { "<leader>msbp", ":CMakeSelectBuildPreset<CR>", desc = "preset" },
    { "<leader>msl", ":CMakeSelectLaunchTarget<CR>", desc = "launch target" },
    { "<leader>msk", ":CMakeSelectKit<CR>", desc = "kit"},
    { "<leader>msc", ":CMakeSelectConfigurePreset<CR>", desc = "configure preset" },

    -- windows
    { "<leader>wL", desc = "move current window to right" },
    { "<leader>wH", desc = "move current window to left" },
    { "<leader>wJ", desc = "move current window to buttom" },
    { "<leader>wK", desc = "move current window to up" },

    -- others
    { "<leader>n", group = "cancel" },
    { "<leader>nh", ":nohlsearch<CR>", desc = "no highlight search" },
})
