return {
	"danymat/neogen",
	config = true,
	opts = {
		snippet_engine = "luasnip",
	},
	keys = {
		{
			"<leader>cd",
			function()
				require("neogen").generate()
			end,
			desc = "Generate Annotations (Neogen)",
		},
	},
}
