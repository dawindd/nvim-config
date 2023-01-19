vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		require("lsp/keybinds").setup(bufnr, client)
		require("lsp/highlighting").setup(bufnr, client)
	end,
	desc = "Sets up lsp functions",
})
