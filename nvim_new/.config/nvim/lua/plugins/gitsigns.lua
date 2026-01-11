return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[S]tage hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[R]eset hunk" })
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "[S]tage hunk" })
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "[R]eset hunk" })

			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[S}tage buffer" })
			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[R]eset buffer" })

			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[P]review hunk" })
			map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Preview hunk [i]nline" })

			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "[B]lame line" })

			map("n", "<leader>gd", gitsigns.diffthis, { desc = "[D]iff this" })
			map("n", "<leader>gD", function()
				gitsigns.diffthis("~")
			end, { desc = "[D]iff this ~" })

			map("n", "<leader>gB", gitsigns.toggle_current_line_blame, { desc = "Toggle line [b]lame" })
			map("n", "<leader>gW", gitsigns.toggle_word_diff, { desc = "Toggle [w]ord diff" })

			map("n", "<leader>gQ", function()
				gitsigns.setqflist("all")
			end, { desc = "Add all to [Q]uickfix" })
			map("n", "<leader>gq", gitsigns.setqflist, { desc = "Add to [Q]uickfix" })
		end,
	},
}
