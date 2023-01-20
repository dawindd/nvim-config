Ensure("colorizer", function(colorizer)
	colorizer.setup({
		filetypes = { "*" },
		user_default_options = {
			css = true,
			RRGGBBAA = true,
			mode = "background",
		},
	})
end)
