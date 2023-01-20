local M = {}

vim.api.nvim_create_augroup("AutoFormat", { clear = true })

local function format_whole_file()
	local view = vim.fn.winsaveview()
	vim.api.nvim_win_set_cursor(0, { 1, 0 })
	vim.cmd.normal("gqG")
	vim.fn.winrestview(view)
end

vim.api.nvim_create_user_command("Format",
	function()
		format_whole_file()
	end,
	{ desc = "Formats whole current buffer, respecting formatexpr and formatprog" }
)

function M.create_autocommand()
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = 0,
		callback = format_whole_file,
		desc = "Format buffer on write",
		group = "AutoFormat",
	})
end

return M
