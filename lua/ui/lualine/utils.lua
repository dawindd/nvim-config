local M = {}

vim.api.nvim_create_augroup("MacroReminder", { clear = true })
vim.api.nvim_create_autocmd({ "RecordingLeave" }, {
	callback = function()
		Recorded_macros = Recorded_macros or {}
		local reg = vim.fn.reg_recording()
		if not vim.tbl_contains(Recorded_macros, reg) then
			Recorded_macros = vim.list_extend(Recorded_macros, { reg }, 1, 1)
		end
	end,
	desc = "Keeps track of recorded macros",
	group = "MacroReminder",
})

function M.get_loaded_buffers()
	return vim.tbl_filter(function(buffer)
		return 1 == vim.fn.buflisted(buffer)
	end, vim.api.nvim_list_bufs())
end

function M.get_macro_status()
	local macro = vim.fn.reg_recording()
	if macro ~= "" then
		return "Recording @" .. macro
	end
	if Recorded_macros ~= {} then
		local toprint = ""
		local max = #Recorded_macros
		for index, reg in ipairs(Recorded_macros) do
			toprint = toprint .. reg
			if index ~= max then
				toprint = toprint .. ","
			end
		end
		return toprint
	end
end

return M
