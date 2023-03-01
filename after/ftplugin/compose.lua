local cmd = { "docker-compose-langserver", "--stdio" }
local root_files = {
	".git",
	"docker-compose.yml",
	"docker-compose.yaml",
	"compose.yml",
	"compose.yaml",
}
local settings = {}

local client = vim.lsp.start({
	name = "compose-lsp",
	cmd = cmd,
	root_dir = require("lsp.utils").find_root(root_files),
	capabilities = require("lsp.utils").get_capabilities(),
	on_attach = require("commands.format").create_autocommand,
	settings = settings,
})

if client == nil then
	vim.notify_once("Language server " ..
	cmd[1] .. " not found, please check your system packages",
		vim.log.levels.ERROR
	)
end
