-- Theme setup
return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		compile = true,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = { bold = true },
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		transparent = false,
		theme = "wave",
		background = {
			dark = "wave",
		},

		overrides = function(colors)
			local theme = colors.theme
			return {
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				FloatTitle = { bg = "none" },

				-- Save an hlgroup with dark background and dimmed foreground
				-- so that you can use it where your still want darker windows.
				-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
				NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

				-- Popular plugins that open floats will link to NormalFloat by default;
				-- set their background accordingly if you wish to keep them dark and borderless
				LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				--
				-- -- Save an hlgroup with dark background and dimmed foreground
				-- -- so that you can use it where your still want darker windows.
				-- -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
				-- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

				-- Popular plugins that open floats will link to NormalFloat by default;
				-- set their background accordingly if you wish to keep them dark and borderless
				-- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				-- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				Pmenu = { bg = "none" }, -- add `blend = vim.o.pumblend` to enable transparency
				-- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
				-- PmenuSbar = { bg = theme.ui.bg_m1 },
				-- PmenuThumb = { bg = theme.ui.bg_p2 },
				-- BlinkCmpDoc = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
				-- BlinkCmpDocBorder = { bg = theme.ui.bg_p1 },
				BlinkCmpMenu = { bg = "none" },
				BlinkCmpMenuBorder = { bg = "none" },
			}
		end,
	},
	config = function(_, opts)
		require("kanagawa").setup(opts)
		vim.cmd("colorscheme kanagawa")
	end,
}
