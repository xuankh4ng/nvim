return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
  enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", icon = "", color = { gui = "bold" } },
				},
				lualine_b = {
					{
						"branch",
						icon = "󰊢",
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						colored = true,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
						},
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					"diagnostics",
				},
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = { modified = " ●", readonly = " " },
					},
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
