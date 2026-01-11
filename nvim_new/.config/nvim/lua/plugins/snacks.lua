-- Snacks collection of plugins
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = { enabled = true },
		dashboard = { enabled = true },
		indent = { enabled = true },
		scroll = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
	},
	keys = {
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find [F]iles",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "[R]ecent",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find [G]it Files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({
					on_show = function()
						vim.cmd.stopinsert()
					end,
					win = {
						input = {
							keys = {
								["d"] = "bufdelete",
							},
						},
						list = { keys = { ["dd"] = "bufdelete" } },
					},
				})
			end,
			desc = "Buffers",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "[Q]uickfix List",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "[G]rep",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "[B]uffer lines",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or [W]ord",
			mode = { "n", "x" },
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search [h]istory",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "[D]iagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer [D]iagnostics",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "[U]ndo history",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git [L]og",
		},
		{
			"<leader>gL",
			function()
				Snacks.lazygit()
			end,
			desc = "Open [L]azygit",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
	},
}
