--- @type vim.lsp.Config
return {
	cmd = {
		"typos-lsp",
	},
	root_markers = { ".git", "typos.toml", "_typos.toml", ".typos.toml", "pyproject.toml", "Cargo.toml" },
}
