--- @type vim.lsp.Config
return {
	cmd = {
		"/home/oldest/Stuff/clangd-linux-snapshot_20251123/clangd_snapshot_20251123/bin/clangd",
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
	on_attach = function(client, bufnr)
		require("clangd_extensions").setup()
		vim.keymap.set(
			"n",
			"<leader>lcs",
			"<cmd>ClangdSwitchSourceHeader<cr>",
			{ desc = "C/C++ [S]witch Source/Header" }
		)
		vim.keymap.set("n", "<leader>lct", "<cmd>:ClangdTypeHierarchy<cr>", { desc = "C/C++ [T]ype Hierarchy" })
		vim.keymap.set("x", "<leader>lca", "<cmd>ClangdAST<cr>", { desc = "C/C++ View [A]ST" })
	end,
}
