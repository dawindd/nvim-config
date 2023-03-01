vim.opt.expandtab = false
vim.opt.formatprg = "rustfmt --emit=stdout"
require("commands.format").create_autocommand()

local cmd = { "rustup", "run", "stable", "rust-analyzer" }
local root_files = {
	"Cargo.toml",
	".git",
}
local settings = {
	["rust-analyzer"] = {
		checkOnSave = {
			command = "clippy",
		},
	},
}

local client = vim.lsp.start({
	name = "rust-analyzer",
	cmd = cmd,
	root_dir = require("lsp.utils").find_root(root_files),
	capabilities = require("lsp.utils").get_capabilities(),
	settings = settings,
})

if client == nil then
	vim.notify_once("Language server " ..
	cmd[1] .. " not found, please check your system packages",
		vim.log.levels.ERROR
	)
end
