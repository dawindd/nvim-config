local U = require("utils")
U.ensure("lualine", function(lualine)
	lualine.setup({
		options = {
			always_divide_middle = false,
			globalstatus = true,
			refresh = {
				statusline = 250,
				tabline = 250,
			},
		},
		sections = {
			lualine_a = { "mode", "require('ui/lualine/utils').get_macro_status()" },
			lualine_b = { "branch" },
			lualine_c = {
				{
					"diff",
					diff_color = {
						added = "DiagnosticHint",
						modified = "DiagnosticWarning",
						removed = "DiagnosticError",
					},
				},
				{
					"require('nvim-treesitter').statusline()",
				},
			},
			lualine_x = {
				{
					"diagnostics",
					sources = {
						"nvim_workspace_diagnostic",
					},
					always_visible = true,
				},
			},
			lualine_y = { {
				"searchcount",
			}, { "location" } },
			lualine_z = { "progress" },
		},
		tabline = {
			lualine_a = { "getcwd" },
			lualine_b = { "filetype" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {
				{
					"buffers",
					mode = 0,
					show_filename_only = false,
					buffers_color = {
						inactive = "lualine_a_inactive",
					},
					symbols = { alternate_file = "" },
				},
			},
			lualine_z = { "#require('ui/lualine/utils').get_loaded_buffers()" },
		},
	})
end)
