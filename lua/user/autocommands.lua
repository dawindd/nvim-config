vim.api.nvim_create_autocmd({ "Filetype" }, {
	callback = function(args)
		if vim.treesitter.highlighter.active[args.buf] ~= nil then
			vim.cmd.normal("zR")
		end
	end
})
