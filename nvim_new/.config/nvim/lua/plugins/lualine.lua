return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			disabled_filetypes = {
				statusline = { "snacks_dashboard" },
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{
					"filetype",
					icon_only = true,
					padding = { left = 1, right = 0 },
					separator = "",
				},
				{ "filename" },
				{ "fileformat" },
			},
			lualine_c = {
				{ "branch" },
				{
					"diff",
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
				},
			},
			lualine_x = {
				{
					"diagnostics",
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = " ",
					},
				},
			},
			lualine_y = {
				{
					"lsp_status",
				},
				{
					function()
						return "  " .. require("dap").status()
					end,
					cond = function()
						return package.loaded["dap"] and require("dap").status() ~= ""
					end,
				},
			},
			lualine_z = { { "progress" }, { "location" } },
		},
	},
}
