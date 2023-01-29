local cmd = { "vscode-json-language-server", "--stdio" }
local schemas = {
	{
		name = "Sumneko Lua Settings",
		url = "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
		fileMatch = { ".luarc.json" },
	},
}
local root_files = { ".git" }
local init_options = {
	provideFormatter = true,
}
local settings = {
	json = {
		schemas = schemas,
		validate = {
			enable = true,
		},
	},
}

local client = vim.lsp.start({
	name = "json-lsp",
	cmd = cmd,
	root_dir = require("lsp/utils").find_root(root_files),
	init_options = init_options,
	on_attach = require("commands/format").create_autocommand,
	settings = settings,
})

if client == nil then
	vim.notify_once("Language server " ..
		cmd[1] .. " not found, please check your system packages",
		vim.log.level.ERROR
	)
end
