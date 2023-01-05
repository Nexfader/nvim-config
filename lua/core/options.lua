local opt = vim.opt

vim.api.nvim_exec('language en_US', true)

-- Basic settings
opt.encoding = 'utf-8'
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.scrolloff = 7
opt.clipboard = 'unnamedplus'
opt.cursorline = true
opt.title = true
opt.showmode = false
vim.g.mapleader = ' '

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- Russian locale support
opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
