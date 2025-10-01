return {
	"Exafunction/windsurf.nvim",
	cond = function()
		local cwd = vim.loop.cwd() or ""
		-- отключаем плагин, если находимся в ~/work/company
		if cwd:match("Work") then
			return false
		end
		return true
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
				key_bindings = {
					accept = "<M-Tab>",
					accept_word = false,
					accept_line = false,
					clear = false,
					next = "<M-]>",
					prev = "<M-[>",
				},
			},
		})
	end,
}
