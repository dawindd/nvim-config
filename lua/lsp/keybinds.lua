local M = {}

function M.setup(bufnr)
	Ensure("fzf-lua", function(fzf)
		vim.keymap.set("n", "<leader>ld", fzf.lsp_definitions, {
			buffer = bufnr,
			desc = "LSP - Show definitions",
		})
		vim.keymap.set("n", "<leader>lu", fzf.lsp_references, {
			buffer = bufnr,
			desc = "LSP - Show usages",
		})
		vim.keymap.set("n", "<leader>lt", fzf.lsp_typedefs, {
			buffer = bufnr,
			desc = "LSP - Show type definition",
		})
		vim.keymap.set("n", "<leader>li", fzf.lsp_implementations, {
			buffer = bufnr,
			desc = "LSP - Show implementation",
		})
		vim.keymap.set("n", "<leader><leader><leader>",
			fzf.lsp_live_workspace_symbols,
			{ desc = "Fuzzy-find workspace symbols" }
		)
		vim.keymap.set("n", "<leader>la", fzf.lsp_code_actions, {
			buffer = bufnr,
			desc = "LSP - Code actions",
		})
	end)

	vim.keymap.set({ "i", "n" }, "<c-k>", vim.lsp.buf.hover, {
		buffer = bufnr,
		desc = "LSP - Show documentation",
	})
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {
		buffer = bufnr,
		desc = "LSP - Rename symbol",
	})
end

return M
