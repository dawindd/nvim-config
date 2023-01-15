local M = {}
vim.api.nvim_create_augroup("AutoFormat", { clear = true })

function M.format_whole_file()
	local cursor = vim.api.nvim_win_get_cursor(0)
	-- Actually format file
	vim.api.nvim_win_set_cursor(0, { 1, 0 })
	vim.cmd.normal("gqG")

	-- Restore cursor position
	local line_count = vim.api.nvim_buf_line_count(0)
	local line_nr = math.min(line_count, cursor[1])
	local line_length = math.max(
		#vim.api.nvim_buf_get_lines(0, line_nr - 1, line_nr, false)[1] - 1,
		0
	)
	local col_nr = math.min(line_length, cursor[2])
	vim.api.nvim_win_set_cursor(0, { line_nr, col_nr })
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
