vim.api.nvim_create_augroup("MacroReminder", { clear = true })
vim.api.nvim_create_autocmd({ "RecordingEnter" }, {
	callback = function()
		vim.opt.cmdheight = 1
	end,
	desc = "Show we are recording a macro",
	group = "MacroReminder"
})
vim.api.nvim_create_autocmd({ "RecordingLeave" }, {
	callback = function()
		vim.opt.cmdheight = 0
	end,
	desc = "Return to normal",
	group = "MacroReminder"
})
