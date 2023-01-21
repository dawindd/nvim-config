local M = {}

function M.setup(bufnr)
	Ensure("gitsigns", function(gitsigns)
		vim.keymap.set({ "n", "v" }, "[g", gitsigns.prev_hunk, {
			buffer = bufnr,
			desc = "Git - Previous hunk",
		})
		vim.keymap.set({ "n", "v" }, "]g", gitsigns.next_hunk, {
			buffer = bufnr,
			desc = "Git - Next hunk",
		})
	end)
end

return M
