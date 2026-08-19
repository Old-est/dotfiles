return {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"xzbdmw/colorful-menu.nvim",
		{ "onsails/lspkind.nvim" },
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
			config = function(_, opts)
				if opts then
					require("luasnip").config.setup(opts)
				end
				vim.tbl_map(function(type)
					require("luasnip.loaders.from_" .. type).lazy_load()
				end, { "vscode", "snipmate", "lua" })
				-- friendly-snippets - enable standardized comments snippets
				-- require("luasnip").filetype_extend("lua", { "luadoc" })
				-- require("luasnip").filetype_extend("python", { "pydoc" })
				-- require("luasnip").filetype_extend("rust", { "rustdoc" })
				-- require("luasnip").filetype_extend("c", { "cdoc" })
				-- require("luasnip").filetype_extend("cpp", { "cppdoc" })
				-- require("luasnip").filetype_extend("sh", { "shelldoc" })
			end,
		},
		{ "saghen/blink.compat", version = "2.*", lazy = true, opts = {} },
		"crispgm/cmp-beancount",
	},
	version = "1.*",
	opts = {
		completion = {
			menu = {
				draw = {
					-- columns = { { "kind_icon" }, { "label", gap = 1 } },
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", gap = 1, "kind" } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},

						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbol_map[ctx.kind] or ""
								end

								return icon .. ctx.icon_gap
							end,
						},
					},
				},
				scrollbar = false,
			},
			accept = {
				auto_brackets = {
					enabled = false,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				treesitter_highlighting = true,
			},
			ghost_text = { enabled = true },
		},
		signature = {
			enabled = true,
		},

		keymap = {
			preset = "enter",
			["<Tab>"] = {
				"select_next",
				"fallback",
			},

			["<S-Tab>"] = {
				"select_prev",
				"fallback",
			},
			["<C-k>"] = false,
		},

		cmdline = {
			keymap = { preset = "cmdline" },
			completion = { menu = { auto_show = false } },
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"exact",
				-- defaults
				"score",
				function(a, b)
					if not a.lsp_score or not b.lsp_score then
						return
					end

					local diff = (b.lsp_score * b.score) - (a.lsp_score * a.score)

					return (diff < 0)
				end,
				"sort_text",
			},
		},

		sources = {
			default = { "lsp", "snippets", "path", "buffer" },
			per_filetype = {
				beancount = { "beancount", "lsp", "snippets" },
				lua = { inherit_defaults = true, "lazydev" },
			},

			providers = {
				beancount = {
					name = "beancount",
					module = "blink.compat.source",

					opts = {
						account = "/home/oldest/Documents/finance/main.beancount",
					},
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
	},
}
