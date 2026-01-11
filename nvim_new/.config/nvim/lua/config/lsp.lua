for _, f in pairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
	local name = vim.fn.fnamemodify(f, ":t:r")
	vim.lsp.enable(name)
end

local diagnostic_config = {
	--- options for vim.diagnostics.config()
	underline = true,
	inlay_hints = { enabled = true },
	virtual_text = {
		severity = { max = "WARN" },
		spacing = 4,
		prefix = "● ",
	},
	virtual_lines = {
		current_line = true,
		severity = { min = "ERROR" },
	},
}

vim.diagnostic.config(diagnostic_config)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { ev.buf })
		end

		local picker = require("snacks").picker

		vim.keymap.set("n", "<leader>ls", picker.lsp_symbols, { desc = "LSP [S]ymbols" })
		vim.keymap.set("n", "<leader>lS", picker.lsp_workspace_symbols, { desc = "LSP Workspace [S]ymbols" })
		vim.keymap.set("n", "<leader>li", picker.lsp_implementations, { desc = "Goto [I]mplementation" })
		vim.keymap.set("n", "<leader>lt", picker.lsp_type_definitions, { desc = "Goto [T]ype Definition" })
		vim.keymap.set("n", "<leader>ld", picker.lsp_definitions, { desc = "Goto [D]efinition" })
		vim.keymap.set("n", "<leader>lD", picker.lsp_declarations, { desc = "Goto [D]eclaration" })
		vim.keymap.set("n", "<leader>lr", picker.lsp_references, { desc = "[R]eferences" })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code [A]ctions" })
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Documentation" })
	end,
})
