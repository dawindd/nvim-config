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
		vim.keymap.set("n", "<leader>gah", gitsigns.stage_hunk, {
			buffer = bufnr,
			desc = "Git - Stage hunk",
		})
	end)
end

return M
