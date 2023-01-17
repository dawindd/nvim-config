vim.api.nvim_create_augroup("LspKeybinds", { clear = true })
vim.api.nvim_create_autocmd({ "LspAttach" }, {
	callback = function()
		vim.keymap.set({ "n" }, "<leader>ld", vim.lsp.buf.definition, {
			buffer = 0,
			desc = "LSP - Show definition",
		})

		vim.keymap.set({ "n" }, "<leader>lk", vim.lsp.buf.hover, {
			buffer = 0,
			desc = "LSP - Show documentation",
		})

		vim.keymap.set({ "n" }, "<leader>li", vim.lsp.buf.implementation, {
			buffer = 0,
			desc = "LSP - Show implementation",
		})

		vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, {
			buffer = 0,
			desc = "LSP - Show function signature",
		})

		vim.keymap.set({ "n" }, "<leader>lD", vim.lsp.buf.type_definition, {
			buffer = 0,
			desc = "LSP - Show type definition",
		})

		vim.keymap.set({ "n" }, "<leader>lr", vim.lsp.buf.rename, {
			buffer = 0,
			desc = "LSP - Rename symbol",
		})

		vim.keymap.set({ "n" }, "<leader>la", vim.lsp.buf.code_action, {
			buffer = 0,
			desc = "LSP - Code actions",
		})

		vim.keymap.set({ "n" }, "<leader>lu", vim.lsp.buf.references, {
			buffer = 0,
			desc = "LSP - Show uses"
		})
	end,
	desc = "Setup LSP keybindings",
	group = "LspKeybinds",
})
