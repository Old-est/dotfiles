return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		branch = "main",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"cmake",
				"bash",
				"lua",
				"luadoc",
				"diff",
				"beancount",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"rust",
				"gitignore",
				"ssh_config",
				"latex",
				"html",
				"yaml",
                "vimdoc",
                "query"
			},
		},

		config = function(_, opts)
			if opts.ensure_installed and #opts.ensure_installed > 0 then
				require("nvim-treesitter").install(opts.ensure_installed)
				-- register and start parsers for filetypes
				for _, parser in ipairs(opts.ensure_installed) do
					local filetypes = parser -- In this case, parser is the filetype/language name
					vim.treesitter.language.register(parser, filetypes)

					vim.api.nvim_create_autocmd({ "FileType" }, {
						pattern = filetypes,
						callback = function(event)
							vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
							vim.wo.foldmethod = "expr"
							vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
							vim.treesitter.start(event.buf, parser)
						end,
					})
				end
			end
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
		},
		opts = {
			multiwindow = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		keys = {
			{
				"af",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
				end,
				desc = "Select outer function",
				mode = { "x", "o" },
			},
			{
				"if",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
				end,
				desc = "Select inner function",
				mode = { "x", "o" },
			},
			{
				"ac",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
				end,
				desc = "Select outer class",
				mode = { "x", "o" },
			},
			{
				"ic",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
				end,
				desc = "Select inner class",
				mode = { "x", "o" },
			},
			{
				"as",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
				end,
				desc = "Select local scope",
				mode = { "x", "o" },
			},
		},
		---@module "nvim-treesitter-textobjects"
		opts = { multiwindow = true },
	},
	
}
