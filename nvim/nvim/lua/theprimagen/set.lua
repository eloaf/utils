-- show line numbers in a pretty way
vim.cmd [[
  set number
  set numberwidth=1
]]

vim.opt.number = true

-- Etc
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- To get long undo history??
vim.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.g.mapleader = " "


-- set encoding=utf8
-- let g:airline_powerline_fonts = 1
vim.opt.encoding = "utf8"

-- Go check theprimeagen's video on this (nvim setup from scratch)
-- :help index 
-- TODO tabs?
