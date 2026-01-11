return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "master",

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		require("nvim-treesitter.install").prefer_git = true
		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},

			indent = {
				enable = true,
				disable = { "python", "blade" },
			},

			ensure_installed = {
				"lua",
				"regex", "markdown", "markdown_inline",
				"blade", "php",
				"html",
			},

			auto_install = true,

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>",
					node_incremental = "<Enter>",
					node_decremental = "<Backspace>",
					scope_incremental = "<Enter>",
				},
			},
		})
	end,
}
