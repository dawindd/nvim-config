Ensure("nvim-treesitter.configs", function(configs)
	require("user/parsers")
	configs.setup({
		auto_install = false,
		highlight = { enable = true },
		incremental_selection = { enable = false },
		indent = { enable = true },
		playground = {
			enable = true,
			keybindings = {
				toggle_query_editor = "i",
				toggle_hl_groups = "h",
			},
		},
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
		refactor = {
			navigation = {
				enable = true,
				keymaps = {
					goto_definition = "gd",
					list_definitions = "gD",
					goto_previous_usage = "[u",
					goto_next_usage = "]u",
				},
			},
			smart_rename = {
				enable = true,
				keymaps = {
					smart_rename = "gr",
				},
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
					["ac"] = "@conditional.outer",
					["ic"] = "@conditional.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
				},
				include_surrounding_whitespace = true,
			},
		},
	})

	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	vim.opt.foldmethod = "expr"
end)
