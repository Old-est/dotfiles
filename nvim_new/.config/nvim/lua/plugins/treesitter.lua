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
				"query",
				"toml",
				"json",
				"c3",
			},
		},

		config = function(_, opts)
			if opts.ensure_installed and #opts.ensure_installed > 0 then
				require("nvim-treesitter").install(opts.ensure_installed)
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
		},
		opts = {
			multiwindow = true,
			max_lines = 3,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		keys = {
			-- Function
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
			-- Class / Struct
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
			-- Parameter / Argument
			{
				"aa",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
				end,
				desc = "Select outer parameter",
				mode = { "x", "o" },
			},
			{
				"ia",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
				end,
				desc = "Select inner parameter",
				mode = { "x", "o" },
			},
			-- Conditional (if / else)
			{
				"ai",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
				end,
				desc = "Select outer conditional",
				mode = { "x", "o" },
			},
			{
				"ii",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
				end,
				desc = "Select inner conditional",
				mode = { "x", "o" },
			},
			-- Loop
			{
				"al",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
				end,
				desc = "Select outer loop",
				mode = { "x", "o" },
			},
			{
				"il",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
				end,
				desc = "Select inner loop",
				mode = { "x", "o" },
			},
			-- Call
			{
				"aC",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects")
				end,
				desc = "Select outer call",
				mode = { "x", "o" },
			},
			{
				"iC",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects")
				end,
				desc = "Select inner call",
				mode = { "x", "o" },
			},
			-- Assignment
			{
				"a=",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects")
				end,
				desc = "Select outer assignment",
				mode = { "x", "o" },
			},
			{
				"i=",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects")
				end,
				desc = "Select inner assignment",
				mode = { "x", "o" },
			},
			{
				"l=",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@assignment.lhs", "textobjects")
				end,
				desc = "Select assignment LHS",
				mode = { "x", "o" },
			},
			{
				"r=",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@assignment.rhs", "textobjects")
				end,
				desc = "Select assignment RHS",
				mode = { "x", "o" },
			},
			-- Comment
			{
				"a/",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")
				end,
				desc = "Select outer comment",
				mode = { "x", "o" },
			},
			{
				"i/",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")
				end,
				desc = "Select inner comment",
				mode = { "x", "o" },
			},
			-- Scope / Block
			{
				"as",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
				end,
				desc = "Select local scope",
				mode = { "x", "o" },
			},
			{
				"ab",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects")
				end,
				desc = "Select outer block",
				mode = { "x", "o" },
			},
			{
				"ib",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects")
				end,
				desc = "Select inner block",
				mode = { "x", "o" },
			},
			-- Return / Number
			{
				"ar",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@return.outer", "textobjects")
				end,
				desc = "Select return statement",
				mode = { "x", "o" },
			},
			{
				"an",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@number.inner", "textobjects")
				end,
				desc = "Select number",
				mode = { "x", "o" },
			},
			-- ========== MOVE ==========
			-- Next / Previous function
			{
				"]f",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
				end,
				desc = "Next function start",
				mode = { "n", "x", "o" },
			},
			{
				"]F",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
				end,
				desc = "Next function end",
				mode = { "n", "x", "o" },
			},
			{
				"[f",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
				end,
				desc = "Prev function start",
				mode = { "n", "x", "o" },
			},
			{
				"[F",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
				end,
				desc = "Prev function end",
				mode = { "n", "x", "o" },
			},
			--- Next / Previous class
			{
				"]k",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
				end,
				desc = "Next class start",
				mode = { "n", "x", "o" },
			},
			{
				"]K",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
				end,
				desc = "Next class end",
				mode = { "n", "x", "o" },
			},
			{
				"[k",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
				end,
				desc = "Prev class start",
				mode = { "n", "x", "o" },
			},
			{
				"[K",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
				end,
				desc = "Prev class end",
				mode = { "n", "x", "o" },
			},
			-- Next / Previous parameter
			{
				"]a",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
				end,
				desc = "Next parameter",
				mode = { "n", "x", "o" },
			},
			{
				"[a",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
				end,
				desc = "Prev parameter",
				mode = { "n", "x", "o" },
			},

			-- Next / Previous conditional
			{
				"]i",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
				end,
				desc = "Next conditional",
				mode = { "n", "x", "o" },
			},
			{
				"[i",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
				end,
				desc = "Prev conditional",
				mode = { "n", "x", "o" },
			},

			-- Next / Previous loop
			{
				"]l",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
				end,
				desc = "Next loop",
				mode = { "n", "x", "o" },
			},
			{
				"[l",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
				end,
				desc = "Prev loop",
				mode = { "n", "x", "o" },
			},
			-- ========== SWAP ==========
			{
				"<leader>a",
				function()
					require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
				end,
				desc = "Swap parameter with next",
				mode = "n",
			},
			{
				"<leader>A",
				function()
					require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
				end,
				desc = "Swap parameter with previous",
				mode = "n",
			},
		},
		---@module "nvim-treesitter-textobjects"
		opts = { multiwindow = true },
	},
}
