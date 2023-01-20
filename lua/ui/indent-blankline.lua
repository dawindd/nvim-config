Ensure("indent_blankline", function(indentlines)
	local hl_list = {}
	for i = 1, 8, 1 do
		hl_list[i] = "IndentBlankLine" .. i
	end
	indentlines.setup({
		char_highlight_list = hl_list,
		show_current_context = true,
		show_current_context_start = true,
		show_current_context_start_on_current_line = false,
		show_trailing_blankline_indent = false,
		use_treesitter_scope = false,
	})
end)
