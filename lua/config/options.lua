local option = vim.opt

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable Nerd Font
vim.g.have_nerd_font = true

-- Default Shell
option.shell = "bash"

-- Set number line
option.nu = true
option.relativenumber = true

-- Decrease update time
option.updatetime = 250

-- -- Decrease mapped sequence wait time
option.timeoutlen = 300

-- Tabs
option.tabstop = 2
option.softtabstop = 2
option.shiftwidth = 2
option.expandtab = true

-- Indentation
option.autoindent = true
option.smartindent = true
option.breakindent = true

-- Setup Wrap
option.wrap = false

-- Swap file
option.swapfile = false

-- Cursor
option.mouse = "a"
option.cursorline = false

-- Scroll
option.scrolloff = 5

-- Save undo history
option.undofile = true

-- Search
option.inccommand = "split"
option.incsearch = true
option.ignorecase = true
option.smartcase = true
option.hlsearch = true

-- UI
option.winborder = "rounded"
option.showmode = false
option.termguicolors = true
option.background = "dark"
option.signcolumn = "yes"
option.fillchars:append({ eob = " " })

-- Backspace
option.backspace = { "start", "eol", "indent" }

-- Split window
option.splitright = true
option.splitbelow = true

-- Clipboard
vim.schedule(function()
  option.clipboard = "unnamedplus"
end)

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Diagnostic Config
vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  -- signs = vim.g.have_nerd_font and {
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = "E ",
  --     [vim.diagnostic.severity.WARN] = "W ",
  --     [vim.diagnostic.severity.INFO] = "I ",
  --     [vim.diagnostic.severity.HINT] = "H ",
  --   },
  -- } or {},
  underline = true,
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})
