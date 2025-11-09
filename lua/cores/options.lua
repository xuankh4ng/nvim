local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic
opt.shell = "bash"
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 10

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.backspace = { "indent", "eol", "start" }

-- File Handing
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.updatetime = 300
opt.timeoutlen = 500

-- Visual
opt.signcolumn = "yes"
opt.winborder = "single"
opt.termguicolors = true
opt.showmode = false

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
