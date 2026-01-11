local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic
opt.shell = "bash"
opt.wrap = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.splitright = true
opt.confirm = true
opt.scrolloff = 10

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
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

-- Visual
opt.signcolumn = "yes"
opt.winborder = "single"
opt.background = "dark"
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
