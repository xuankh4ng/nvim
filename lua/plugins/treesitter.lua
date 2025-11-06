return {
	'nvim-treesitter/nvim-treesitter',
	event = { 'BufReadPre', 'BufNewFile' },
	build = ':TSUpdate',
	branch = 'master',

	config = function()
		local treesitter = require('nvim-treesitter.configs')

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},

			ensure_installed = {
				'lua',
        'python',
        'regex',
			},

			auto_install = true,
		})
	end,
}
