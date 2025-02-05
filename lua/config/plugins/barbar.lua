return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
			require("barbar").setup({
				animation = true,
				icons = {
					gitsigns = {
						added = { enabled = true, icon = "+" },
						changed = { enabled = true, icon = "~" },
					},
					buffer_number = true,
				},
			})
		end,
		opts = {},
		version = "^1.9.1",
	},
}
