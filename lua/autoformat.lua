local M = {}
vim.api.nvim_create_augroup("AutoFormat", { clear = true })

function M.format_whole_file()
	local view = vim.fn.winsaveview()
	vim.api.nvim_win_set_cursor(0, { 1, 0 })
	vim.cmd.normal("gqG")
	vim.fn.winrestview(view)
end

function M.create_autocommand()
	vim.api.nvim_create_autocmd({ "BufWritePre" }, {
		buffer = 0,
		callback = M.format_whole_file,
		desc = "Format buffer on write",
		group = "AutoFormat",
	})
end

return M
