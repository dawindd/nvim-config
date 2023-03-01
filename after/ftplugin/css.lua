local cmd = { "vscode-css-language-server", "--stdio" }
local root_files = { ".git" }
local settings = {
	css = {
		validate = true,
	}
}

local client = vim.lsp.start({
	name = "css-lsp",
	cmd = cmd,
	root_dir = require("lsp.utils").find_root(root_files),
	capabilities = require("lsp.utils").get_capabilities(),
	settings = settings,
	on_attach = require("commands.format").create_autocommand,
})

if client == nil then
	vim.notify_once("Language server " ..
	cmd[1] .. " not found, please check your system packages",
		vim.log.levels.ERROR
	)
end
