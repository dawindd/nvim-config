vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ on_macro = true, timeout = 300 })
	end,
	desc = "Highlights yanked text",
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})
