local cmd = { "vscode-html-language-server", "--stdio" }
local root_files = {
	".git",
}
local init_options = {
	configurationSection = { "html", "css", "javascript" },
	embeddedLanguages = {
		css = true,
		javascript = true,
	},
	provideFormatter = true,
}

local client = vim.lsp.start({
	name = "html-lsp",
	cmd = cmd,
	root_dir = require("lsp/utils").find_root(root_files),
	init_options = init_options,
	on_attach = require("commands/format").create_autocommand,
})

if client == nil then
	vim.notify_once("Language server " ..
		cmd[1] .. " not found, please check your system packages",
		vim.log.level.ERROR
	)
end
