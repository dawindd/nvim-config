Ensure("fzf-lua", function(fzf)
	fzf.setup({
		winopts = {
			fullscreen = true,
			preview = {
				layout = "flex",
				wrap = "wrap",
			},
			-- split = "belowright new"
		},
	})
	require("fzf.keybinds")
end)
