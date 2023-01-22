Ensure("fzf-lua", function(fzf)
	vim.keymap.set("n", "<leader>dw", fzf.diagnostics_workspace, {
		desc = "Diagnostics - Workspace",
	})
	vim.keymap.set("n", "<leader>db", fzf.diagnostics_document, {
		desc = "Diagnostics - Buffer",
	})
end)
