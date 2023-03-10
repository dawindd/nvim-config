Ensure("tokyonight", function(tokyonight)
	tokyonight.setup({
		style = "night",
		transparent = true,
		terminal_colors = true,
		styles = {
			floats = "dark",
			sidebars = "normal",
		},
		on_highlights = function(highlights, colors)
			local rainbow = {
				colors.red,
				colors.orange,
				colors.yellow,
				colors.green,
				colors.green1,
				colors.cyan,
				colors.blue,
				colors.purple,
			}
			for index, color in ipairs(rainbow) do
				highlights["IndentBlankline" .. index] =
				{ foreground = color, nocombine = true }
			end
			highlights.IndentBlankLineContextChar =
			{ foreground = rainbow[#rainbow] }
			highlights.IndentBlankLineContextStart =
			{ special = rainbow[#rainbow], underline = true }
			highlights.QuickScopePrimary =
			{ special = colors.green, underdouble = true }
			highlights.QuickScopeSecondary =
			{ special = colors.yellow, underdouble = true }
			highlights.FidgetTitle = { foreground = colors.cyan }
			highlights.FidgetTask = { link = "FidgetTitle" }
		end,
	})
	vim.cmd.colorscheme("tokyonight")
end)
