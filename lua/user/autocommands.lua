vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost", "Filetype" }, {
	callback = function()
		vim.cmd.normal("zR")
	end,
	group = vim.api.nvim_create_augroup("AutoUnfold", { clear = true })
})
