local cmd = { "bash-language-server", "start" }
local root_files = {
	".shellcheckrc",
	".git",
}

local client = vim.lsp.start({
	name = "bash-lsp",
	cmd = cmd,
	root_dir = require("lsp.utils").find_root(root_files),
	capabilities = require("lsp.utils").get_capabilities(),
})

if client == nil then
	vim.notify_once("Language server " ..
	cmd[1] .. " not found, please check your system packages",
		vim.log.levels.ERROR
	)
end
