vim.filetype.add({
	pattern = {
		[".*/kitty/.*%.conf"] = "kitty",
		[".*/kitty/.*%.session"] = "kitty-session",
	},
})
