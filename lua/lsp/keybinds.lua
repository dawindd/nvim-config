local M = {}

function M.setup()
	vim.api.nvim_create_augroup("LspKeybinds", { clear = true })
	vim.api.nvim_create_autocmd({ "LspAttach" }, {
		callback = function()
			-- LSP
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
				desc = "LSP - Show uses",
			})
			-- Diagnostics
			vim.keymap.set({ "n" }, "[d", vim.diagnostic.goto_prev, {
				buffer = 0,
				desc = "Diagnostic - Goto previous"
			})
			vim.keymap.set({ "n" }, "]d", vim.diagnostic.goto_next, {
				buffer = 0,
				desc = "Diagnostic - Goto next",
			})
			vim.keymap.set({ "n" }, "[e", function()
				vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, {
				buffer = 0,
				desc = "Diagnostic - Goto previous error",
			})
			vim.keymap.set({ "n" }, "]e", function()
				vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, {
				buffer = 0,
				desc = "Diagnostic - Goto next error",
			})
			-- Completion
			vim.keymap.set({ "i" }, "<c-tab>", "<c-x><c-o>", { desc = "Tab to complete" })
			vim.keymap.set({ "i" }, "<tab>", function()
				if vim.fn.pumvisible() == 1 then
					return "<c-n>"
				else
					return "<tab>"
				end
			end, {
				buffer = 0,
				desc = "LSP - Next completion",
				expr = true,
			})
			vim.keymap.set({ "i" }, "<s-tab>", function()
				if vim.fn.pumvisible() == 1 then
					return "<c-p>"
				else
					return "<s-tab>"
				end
			end, {
				buffer = 0,
				desc = "LSP - Previous completion",
				expr = true,
			})
		end,
		desc = "Setup LSP keybindings",
		group = "LspKeybinds",
	})
end

return M
