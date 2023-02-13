vim.filetype.add({
	pattern = {
		[".*/docker-compose.ya?ml"] = "compose",
		[".*/compose.ya?ml"] = "compose",
	}
})
