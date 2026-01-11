-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true
opt.confirm = true
opt.shell = "bash"
opt.scrolloff = 10

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.backspace = { "indent", "eol", "start" }

opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true

opt.signcolumn = "yes"
opt.winborder = "single"
opt.background = "dark"
opt.termguicolors = true

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Keymaps
local map = vim.keymap.set
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down a line in VISUAL SELECTION" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up a line in VISUAL SELECTION" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", {desc = "Clear highlight search"})

map("v", "<", "<gv", { desc = "Increase indent in VISUAL" })
map("v", ">", ">gv", { desc = "Decrease indent in VISUAL" })

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit in TERMINAL" })

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window"})
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window"})
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window"})
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window"})

-- Lazy & Plugins
require("lazy").setup({
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = { notify = false, },

	-- Plugins
	spec = {
		-- Colorscheme
		{
			"neanias/everforest-nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("everforest").setup({
					background = "hard",
					disable_italic_comment = true,
					ui_contrast = "high",
					transparent_background_level = 0,
					float_style = "bright",
				})
				vim.cmd("colorscheme everforest")
			end,
		},

		-- Files
		{
			"stevearc/oil.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				columns = {
					{ "permissions", highlight = "Function" },
					{ "mtime", highlight = "Comment", format = "%b %d %H:%M" },
					{ "size", highlight = "Special" },
				},
				delete_to_trash = true,
				view_options = { show_hidden = true, },
			},
			keys = {
				{
					"<leader>o",
					"<CMD>Oil<CR>",
					desc = "Oil",
				},
			}
		},
	},
})
