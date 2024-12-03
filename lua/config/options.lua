-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local g = vim.g

g.mapleader = ";"
g.maplocalleader = ";"
opt.scrolloff = 10

if g.neovide then
    opt.guifont = "SauceCodePro NF:h13"
end

