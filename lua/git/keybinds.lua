local M = {}

function M.setup(bufnr)
	Ensure("gitsigns", function(gitsigns)
		vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, {
			buffer = bufnr,
			desc = "Git - Buffer diff",
		})
		vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, {
			buffer = bufnr,
			desc = "Git - Hunk diff",
		})
		vim.keymap.set("n", "<leader>gab", gitsigns.stage_buffer, {
			buffer = bufnr,
			desc = "Git - Stage buffer",
		})
		vim.keymap.set("n", "<leader>gub", gitsigns.reset_buffer_index, {
			buffer = bufnr,
			desc = "Git - Unstage buffer",
		})
		vim.keymap.set("n", "<leader>grb", gitsigns.reset_buffer, {
			buffer = bufnr,
			desc = "Git - Reset buffer",
		})
		vim.keymap.set("n", "<leader>gah", gitsigns.stage_hunk, {
			buffer = bufnr,
			desc = "Git - Stage hunk",
		})
		vim.keymap.set("n", "<leader>guh", gitsigns.undo_stage_hunk, {
			buffer = bufnr,
			desc = "Git - Unstage last hunk",
		})
		vim.keymap.set("n", "<leader>grh", gitsigns.reset_hunk, {
			buffer = bufnr,
			desc = "Git - Reset hunk",
		})
	end)
end

return M
