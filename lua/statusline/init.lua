Ensure("lualine", function(lualine)
	lualine.setup({
		options = {
			always_divide_middle = false,
			globalstatus = true,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = { "mode", "require('statusline/utils').get_macro_status()" },
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
			},
			lualine_x = {
				{
					"diagnostics",
					always_visible = false,
					sources = {
						"nvim_workspace_diagnostic",
					},
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = " ",
					},
				},
			},
			lualine_y = {
				{ "searchcount" },
				{ "location" },
			},
			lualine_z = { "progress" },
		},
		tabline = {
			lualine_a = {
				{
					"filename",
					path = 1,
					newfile_status = true,
					symbols = {
						modified = "",
						readonly = "",
						unnamed = "?",
						newfile = "!",
					},
				}
			},
			lualine_b = { "filetype" },
			lualine_c = { "require('statusline.utils').get_buffer_servers()" },
			lualine_x = {},
			lualine_y = {
				{
					"buffers",
					mode = 0,
					show_filename_only = false,
					hide_filename_extension = true,
					buffers_color = {
						inactive = "lualine_a_inactive",
					},
					symbols = { alternate_file = "" },
				},
			},
			lualine_z = { "#require('statusline/utils').get_loaded_buffers()" },
		},
	})
end)
