local set = vim.opt

set.nu = true
set.relativenumber = true

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

set.smartindent = true

set.termguicolors = true

set.swapfile = false
set.backup = false

set.hlsearch = false
set.incsearch = true

set.scrolloff = 8
set.updatetime = 50
set.timeoutlen = 500
set.timeout = true
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false
set.clipboard = "unnamedplus"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
