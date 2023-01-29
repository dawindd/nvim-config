local cmd = { "lua-language-server" }
local before_init = function() end
local root_files = {
	".git",
	".luarc.json",
	".stylua.toml",
	"stylua.toml",
}
local settings = {
	Lua = {
		completion = {
			callSnippet = "Replace",
			displayContext = 2
		},
		hint = {
			enable = true,
			arrayIndex = "Enable",
			setType = true,
		},
		telemetry = {
			enable = false
		},
	},
}

Ensure("neodev", function(neodev)
	neodev.setup({
		lspconfig = false,
		override = function(_, library)
			local path = vim.api.nvim_buf_get_name(0)
			if path:find("nvim", 1, true) ~= nil then
				library.enabled = true
				library.runtime = true
				library.types = true
				library.plugins = true
			end
		end,
	})
	before_init = require("neodev.lsp").before_init
end)

local client = vim.lsp.start({
	name = "lua-lsp",
	cmd = cmd,
	root_dir = require("lsp/utils").find_root(root_files),
	before_init = before_init,
	on_attach = require("commands/format").create_autocommand,
	settings = settings,
})

if client == nil then
	vim.notify_once("Language server " ..
		cmd[1] .. " not found, please check your system packages",
		vim.log.level.ERROR
	)
end
