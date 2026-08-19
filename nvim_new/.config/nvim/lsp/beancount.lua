--- @type vim.lsp.Config
return {
	cmd = { "beancount-language-server", "--stdio" },
    filetypes = { 'beancount', 'bean' },
	root_markers = { "main.beancount", ".git" },
	init_options = {
		journal_file = "~/Documents/finance/main.beancount",
		formatting = {
			currency_column = 60,
		},
	},
}
