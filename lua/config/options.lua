-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local g = vim.g

g.mapleader = ";"
g.maplocalleader = "\\"
opt.scrolloff = 10

vim.filetype.add({
  pattern = {
    [".*.qrc"] = "xml",
    [".*.ixx"] = "cpp",
  },
})

if g.neovide then
  if vim.fn.has("win32") == 1 then
    opt.guifont = "SauceCodePro Nerd Font:h10"
  else
    opt.guifont = "SauceCodePro NF:h12"
  end
  g.neovide_transparency = 0.85
end
