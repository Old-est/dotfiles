return {
	"nvim-mini/mini.nvim",
	version = false,
	opts = {
		surround = {
			mappings = {
				add = "za",
				delete = "zd",
				find = "zf",
				find_left = "zF",
				highlight = "zh",
				replace = "zr",
			},
		},
	},
	config = function(_, opts)
		require("mini.ai").setup()
		require("mini.align").setup()
		require("mini.surround").setup(opts.surround)
		require("mini.operators").setup()
		require("mini.move").setup()
		require("mini.bracketed").setup()
	end,
}
