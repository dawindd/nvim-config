local cmd = { "bash-language-server", "start" }
local root_files = {
	".git",
	".shellcheckrc",
}

local client = vim.lsp.start({
	name = "bash-lsp",
	cmd = cmd,
	root_dir = require("lsp/utils").find_root(root_files),
})

if client == nil then
	vim.notify_once("Language server " ..
		cmd[1] .. " not found, please check your system packages",
		vim.log.level.ERROR
	)
end
