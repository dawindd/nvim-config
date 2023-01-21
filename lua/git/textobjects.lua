local M = {}

function M.setup(bufnr)
	Ensure("gitsigns", function(gitsigns)
		vim.keymap.set({ "o", "v", "x" }, "ah", gitsigns.select_hunk, {
			buffer = bufnr,
			desc = "Hunk text object",
		})
	end)
end

return M
