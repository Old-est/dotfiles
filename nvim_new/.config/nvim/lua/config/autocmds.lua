-- Autosource for config files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = vim.fn.stdpath("config") .. "/**/*.lua",
	callback = function()
		vim.cmd("source %")
	end,
})

-- Trim trailing whitespaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		-- Save the cursor position
		local cursor_pos = vim.api.nvim_win_get_cursor(0)
		-- Remove trailing whitespaces
		vim.cmd([[%s/\s\+$//e]])
		-- Restore the cursor position
		vim.api.nvim_win_set_cursor(0, cursor_pos)
	end,
})

local function should_have_cursorline()
	local ignored_filetypes = {
		"dashboard",
		"snacks_dashboard",
		"snacks_picker_input",
        "lazy"
	}

	return not vim.tbl_contains(ignored_filetypes, vim.bo.filetype)
end

-- Enable cursorline when entering a window
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	pattern = "*",
	callback = function()
		vim.wo.cursorline = should_have_cursorline()
	end,
})

-- Disable cursorline when leaving a window
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	pattern = "*",
	callback = function()
		vim.wo.cursorline = false
	end,
})
