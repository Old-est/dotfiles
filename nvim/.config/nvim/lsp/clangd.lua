--- @type vim.lsp.Config
return {
	cmd = {
		"clangd",
		"-j=10",
		"--pch-storage=memory",
		"--header-insertion=never",
		"--fallback-style=llvm",
		"--completion-style=detailed",
		"--limit-results=50",
		"--enable-config",
		"--experimental-modules-support",
	},
	filetypes = { "cpp", "h", "hpp", "cc", "c", "cppm" },
	root_markers = {
		"CMakeLists.txt",
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git",
		vim.uv.cwd(),
	},
	capabilities = {
		textDocument = {
			completion = {
				editsNearCursor = true,
			},
		},
		offsetEncoding = { "utf-8", "utf-16" },
	},
}
