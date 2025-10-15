-- ==============================
--  Basic Vim Settings
-- ==============================

-- Leader key
vim.g.mapleader = " "

-- Disable netrw (using neo-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Tabs and indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true
