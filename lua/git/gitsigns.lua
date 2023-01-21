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
			require("git/keybinds").setup(bufnr)
			require("git/motions").setup(bufnr)
			require("git/textobjects").setup(bufnr)
		end
	})
end)
