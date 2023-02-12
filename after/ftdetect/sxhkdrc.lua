vim.filetype.add({
	extension = {
		sxhkd = "sxhkdrc",
		sxhkdrc = "sxhkdrc",
	},
	pattern = {
		[".*/sxhkd/*"] = "sxhkdrc",
	},
})
