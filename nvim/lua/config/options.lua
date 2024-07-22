-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.colorcolumn = "81,101" -- Show column colors.
opt.wrap = true -- Enable text wrap
opt.scrolloff = 0 -- Lines of context

opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.tabstop = 2 -- Number of spaces tabs count for
opt.colorcolumn = '80'
opt.cursorline = true

vim.g.mapleader = "\\" -- Set leader key to m
