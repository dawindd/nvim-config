local cmd = { "phpactor", "language-server" }
local root_files = { "composer.json", ".git" }
local init_options = {
	["language_server_phpstan.enabled"] = true,
	["language_server_psalm.enabled"] = true,
	["language_server_completion.trim_leading_dollar"] = true,
}

local client = vim.lsp.start({
	name = "phpactor",
	cmd = cmd,
	root_dir = require("lsp/utils").find_root(root_files),
	capabilities = require("lsp/utils").get_capabilities(),
	init_options = init_options,
	on_attach = require("commands/format").create_autocommand,
})

if client == nil then
	vim.notify_once("Language server " ..
	cmd[1] .. " not found, please check your system packages",
		vim.log.levels.ERROR
	)
end
