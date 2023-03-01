local utils = require("completion/utils")

Ensure("cmp", function(cmp)
	Ensure("luasnip", function(luasnip)
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif utils.has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<s-tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable( -1) then
						luasnip.jump( -1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<esc>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.mapping.abort()
					else
						fallback()
					end
				end),
				["<cr>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.mapping.confirm({
							behaviour = cmp.ConfirmBehavior.Replace,
							select = true,
						})
					else
						fallback()
					end
				end)
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			preselect = cmp.PreselectMode.None,
		})
	end)
end)
