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

local client = vim.lsp.start({
	name = "json-lsp",
	cmd = cmd,
	root_dir = require("lsp/utils").find_root(root_files),
	init_options = {
		provideFormatter = true,
	},
	on_attach = require("commands/format").create_autocommand,
	settings = settings,
})

if client == nil then
	vim.notify("Language server " ..
		cmd[1] .. " not found, please check your system packages",
		vim.log.level.ERROR
	)
end
