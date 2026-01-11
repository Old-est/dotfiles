return {
	name = "archive",
	dir = "~/Projects/lua/archive/feat_pickers",
	event = { "BufReadPre" },
	opts = {},
	keys = {
		{
			"<leader>tg",
			function()
				require("archive").task.go_to()
			end,
			desc = "[G]o to task",
		},
		{
			"<leader>th",
			function()
				require("archive").task.hover()
			end,
			desc = "[H]over task",
		},
		{
			"<leader>tc",
			function()
				require("archive").task.create_task()
			end,
			desc = "[C]reate task",
		},
		{
			"<leader>tt",
			function()
				Snacks.picker.task()
			end,
			desc = "Search [t]ask",
		},
		{
			"<leader>tT",
			function()
				Snacks.picker.task_storage()
			end,
			desc = "Search [t]ask storage",
		},
		{
			"<leader>tD",
			function()
				require("archive").task.go_to_decl()
			end,
			desc = "Go to task [D]eclaration",
		},
	},
}
