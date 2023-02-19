vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		vim.cmd.normal("zR")
	end,
	group = vim.api.nvim_create_augroup("AutoUnfold", { clear = true }),
})
