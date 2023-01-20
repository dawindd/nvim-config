Ensure("gitsigns", function(gitsigns)
	gitsigns.setup({
		current_line_blame = true,
		numhl = true,
		signs = {
			add = { text = "+", hl = "DiagnosticHint" },
			change = { text = "~", hl = "DiagnosticWarning" },
			changedelete = { text = "|-", hl = "DiagnosticError" },
			delete = { text = "-", hl = "DiagnosticError" },
			topdelete = { text = "^-", hl = "DiagnosticError" },
		},
		word_diff = false,
		on_attach = function(bufnr)
			-- Keymaps
			vim.keymap.set({ "n", "v" }, "<leader>gd", gitsigns.diffthis, {
				buffer = bufnr,
				desc = "See current buffer diff",
			})

			vim.keymap.set({ "n", "v" }, "<leader>gp", gitsigns.preview_hunk, {
				buffer = bufnr,
				desc = "Preview current hunk",
			})

			vim.keymap.set({ "n", "v" }, "<leader>gab", gitsigns.stage_buffer, {
				buffer = bufnr,
				desc = "Stage current buffer",
			})

			vim.keymap.set({ "n", "v" }, "<leader>gah", gitsigns.stage_hunk, {
				buffer = bufnr,
				desc = "Stage current hunk",
			})

			vim.keymap.set({ "n", "v" }, "[g", gitsigns.prev_hunk, {
				buffer = bufnr,
				desc = "Previous hunk",
			})

			vim.keymap.set({ "n", "v" }, "]g", gitsigns.next_hunk, {
				buffer = bufnr,
				desc = "Next hunk",
			})

			-- Text objects
			vim.keymap.set({ "o", "x" }, "ah", gitsigns.select_hunk, {
				buffer = bufnr,
				desc = "Hunk text object",
			})
		end,
	})
end)
