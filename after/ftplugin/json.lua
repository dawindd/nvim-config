local cmd = { "vscode-json-language-server", "--stdio" }
local schemas = {
	{
		name = "Sumneko Lua Settings",
		url = "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
		fileMatch = { ".luarc.json" },
	},
}
local root_files = { ".git" }
local settings = {
	json = {
		schemas = schemas,
		validate = {
			enable = true,
		},
	},
}

vim.lsp.start({
	name = "json-lsp",
	cmd = cmd,
	root_dir = vim.fs.dirname(
		vim.fs.find(root_files, { upward = true })[1]
		or vim.fn.getcwd()
	),
	init_options = {
		provideFormatter = true,
	},
	on_attach = require("commands/format").create_autocommand,
	settings = settings,
})
