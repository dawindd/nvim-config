Ensure("fzf-lua", function(fzf)
	vim.keymap.set("n", "<leader><leader>f", fzf.files, {
		desc = "Fuzzy-find files in cwd",
	})
	vim.keymap.set("n", "<leader><leader>o", fzf.oldfiles, {
		desc = "Fuzzy-find files in history",
	})
	vim.keymap.set("n", "<leader><leader>h", fzf.help_tags, {
		desc = "Fuzzy-find help tags",
	})
	vim.keymap.set("n", "<leader><leader>g", fzf.git_status, {
		desc = "Fuzzy-find files in git status",
	})
	vim.keymap.set("n", "<leader><leader>l", fzf.diagnostics_workspace, {
		desc = "Open workspace diagnostics ",
	})
	vim.keymap.set("n", "<leader><leader>q", fzf.diagnostics_document, {
		desc = "Open buffer diagnostics",
	})
	vim.keymap.set("n", "<leader><leader>j", fzf.jumps, {
		desc = "Open jump list",
	})
	vim.keymap.set("n", "<leader><leader>b", fzf.buffers, {
		desc = "Fuzzy-find buffers",
	})
	vim.keymap.set("n", "<leader><leader>:", fzf.live_grep_native, {
		desc = "Fuzzy-search project",
	})
end)
