local M = {}

function M.setup(bufnr)
	Ensure("fzf-lua", function(fzf)
		-- LSP
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

	vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, {
		buffer = bufnr,
		desc = "LSP - Show documentation",
	})
	vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, {
		buffer = bufnr,
		desc = "LSP - Show function signature",
	})
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {
		buffer = bufnr,
		desc = "LSP - Rename symbol",
	})
	-- Diagnostics
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
		buffer = bufnr,
		desc = "Diagnostic - Goto previous"
	})
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
		buffer = bufnr,
		desc = "Diagnostic - Goto next",
	})
	vim.keymap.set("n", "[e", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, {
		buffer = bufnr,
		desc = "Diagnostic - Goto previous error",
	})
	vim.keymap.set("n", "]e", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, {
		buffer = bufnr,
		desc = "Diagnostic - Goto next error",
	})
	-- Completion
	vim.keymap.set("i", "<c-tab>", "<c-x><c-o>", {
		buffer = bufnr,
		desc = "LSP - Trigger omnifunc completion"
	})
	vim.keymap.set("i", "<tab>", function()
		if vim.fn.pumvisible() == 1 then
			return "<c-n>"
		else
			return "<tab>"
		end
	end, {
		buffer = bufnr,
		desc = "OmniFunc - Next completion",
		expr = true,
	})
	vim.keymap.set("i", "<s-tab>", function()
		if vim.fn.pumvisible() == 1 then
			return "<c-p>"
		else
			return "<s-tab>"
		end
	end, {
		buffer = bufnr,
		desc = "OmniFunc - Previous completion",
		expr = true,
	})
end

return M
