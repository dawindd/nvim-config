Ensure("fzf-lua", function(fzf)
	vim.keymap.set("n", "<leader>dw", fzf.diagnostics_workspace, {
		desc = "Open workspace diagnostics ",
	})
	vim.keymap.set("n", "<leader>db", fzf.diagnostics_document, {
		desc = "Open buffer diagnostics",
	})
end)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
	{ desc = "Diagnostic - Goto previous" }
)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
	{ desc = "Diagnostic - Goto next" }
)
vim.keymap.set("n", "[e",
	function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end,
	{ desc = "Diagnostic - Goto previous error" }
)
vim.keymap.set("n", "]e",
	function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end,
	{ desc = "Diagnostic - Goto next error" }
)
vim.keymap.set("n", "[w",
	function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	end,
	{ desc = "Diagnostic - Goto previous warning" }
)
vim.keymap.set("n", "]w",
	function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	end,
	{ desc = "Diagnostic - Goto next warning" }
)
