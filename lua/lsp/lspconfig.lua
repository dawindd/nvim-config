local U = require("utils")
U.ensure("lspconfig", function(lspconfig)
	--[[ lspconfig.jsonls.setup({
		on_attach = require("autoformat").create_autocommand,
	}) ]]
end)
