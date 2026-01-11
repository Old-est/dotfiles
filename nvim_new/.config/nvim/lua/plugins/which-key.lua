return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		spec = {
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>l", group = "[L]sp" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>lc", group = "[C]/C++" },
			{ "<leader>t", group = "[T]rouble" },
			{ "<leader>w", group = "Sessions" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
