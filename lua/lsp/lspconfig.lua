local U = require("utils")
U.ensure("lspconfig", function(lspconfig)
	--[[ 	lspconfig.sumneko_lua.setup({
		on_attach = require("autoformat").create_autocommand,
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
					displayContext = 2,
				},
				hint = {
					enable = true,
					arrayIndex = "Enable",
					setType = true,
				},
			},
		},
	}) ]]

	lspconfig.jsonls.setup({
		on_attach = require("autoformat").create_autocommand,
	})
end)
