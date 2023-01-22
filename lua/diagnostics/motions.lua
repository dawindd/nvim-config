vim.keymap.set({ "n", "o", "v" }, "[d", vim.diagnostic.goto_prev,
	{ desc = "Diagnostic - Goto previous" }
)
vim.keymap.set({ "n", "o", "v" }, "]d", vim.diagnostic.goto_next,
	{ desc = "Diagnostic - Goto next" }
)
vim.keymap.set({ "n", "o", "v" }, "[e",
	function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end,
	{ desc = "Diagnostic - Goto previous error" }
)
vim.keymap.set({ "n", "o", "v" }, "]e",
	function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end,
	{ desc = "Diagnostic - Goto next error" }
)
vim.keymap.set({ "n", "o", "v" }, "[w",
	function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	end,
	{ desc = "Diagnostic - Goto previous warning" }
)
vim.keymap.set({ "n", "o", "v" }, "]w",
	function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	end,
	{ desc = "Diagnostic - Goto next warning" }
)
