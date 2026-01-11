return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	opts = {
		ignored_next_char = "[%w%.]",
		check_ts = true,
		ts_config = {
			lua = { "string" },
		},
	},
}
