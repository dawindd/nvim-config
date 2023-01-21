require("diagnostics/keybinds")

vim.fn.sign_define({
	{ name = "DiagnosticSignError", text = "", texthl = "DiagnosticSignError" },
	{ name = "DiagnosticSignWarn", text = "", texthl = "DiagnosticSignWarn" },
	{ name = "DiagnosticSignInfo", text = "", texthl = "DiagnosticSignInfo" },
	{ name = "DiagnosticSignHint", text = "", texthl = "DiagnosticSignHint" },
})
vim.diagnostic.config({
	severity_sort = true,
})
