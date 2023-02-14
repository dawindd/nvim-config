vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost", "Filetype" }, {
	callback = function(args)
		if vim.treesitter.highlighter.active[args.buf] ~= nil then
			vim.cmd.normal("zR")
		end
	end,
	group = vim.api.nvim_create_augroup("AutoUnfold", { clear = true })
})
