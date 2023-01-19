local M = {}

function M.setup(bufnr, client)
	vim.api.nvim_create_augroup("LspHighlight", { clear = true })
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function()
			if not client.server_capabilities.documentHighlightProvider then
				vim.notify("Lsp client " .. client .. " does not support highlighting",
					vim.log.levels.WARN)
				return
			end
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = bufnr,
				callback = function()
					vim.schedule(vim.lsp.buf.document_highlight)
				end,
				desc = "Show references under cursor",
				group = "LspHighlight",
			})
			vim.api.nvim_create_autocmd("CursorMoved", {
				buffer = bufnr,
				callback = function()
					vim.schedule(vim.lsp.buf.clear_references)
				end,
				desc = "Clears references highlighting",
				group = "LspHighlight",
			})
		end,
		desc = "Setup LSP highlighting",
		group = "LspHighlight",
	})
end

return M
