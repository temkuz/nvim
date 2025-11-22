-- tab config
local opt = vim.opt
local indent = 4

-- indention
opt.autoindent = true -- auto indentation
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = indent -- the number of spaces inserted for each indentation
opt.smartindent = true -- make indenting smarter
opt.softtabstop = indent -- when hitting <BS>, pretend like a tab is removed, even if spaces
opt.tabstop = indent -- insert 2 spaces for a tab
opt.shiftround = true -- use multiple of shiftwidth when indenting with "<" and ">"

-- search
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case
opt.wildmenu = true -- make tab completion for files/buffers act like bash

-- line
vim.o.number=true
vim.o.relativenumber = true

-- leader is space
vim.g.mapleader = ' '

-- clipboard
vim.opt.clipboard = "unnamedplus"
