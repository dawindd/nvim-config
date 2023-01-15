local U = require("utils")
U.ensure("fzf-lua", function(fzf)
	vim.keymap.set({ "n", "v" }, "<leader><leader>f", fzf.files, {
		desc = "Fuzzy-find files in cwd",
	})

	vim.keymap.set({ "n", "v" }, "<leader><leader>o", fzf.oldfiles, {
		desc = "Fuzzy-find files in history",
	})

	vim.keymap.set({ "n", "v" }, "<leader><leader>h", fzf.help_tags, {
		desc = "Fuzzy-find help tags",
	})

	vim.keymap.set({ "n", "v" }, "<leader><leader>g", fzf.git_status, {
		desc = "Fuzzy-find files in git status",
	})

	vim.keymap.set({ "n", "v" }, "<leader><leader>l", fzf.loclist, {
		desc = "Open location list",
	})

	vim.keymap.set({ "n", "v" }, "<leader><leader>q", fzf.quickfix, {
		desc = "Open quickfix list",
	})

	vim.keymap.set({ "n", "v" }, "<leader><leader>j", fzf.jumps, {
		desc = "Open jump list",
	})

	vim.keymap.set({ "n", "v" }, "<leader><leader>b", fzf.buffers, {
		desc = "Fuzzy-find buffers",
	})

	vim.keymap.set({ "n", "v" }, "<leader><leader>:", fzf.live_grep_native, {
		desc = "Fuzzy-search project",
	})
end)
