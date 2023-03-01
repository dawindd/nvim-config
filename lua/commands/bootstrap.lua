local paqpath = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

local function quit_if_headless()
	if (#vim.api.nvim_list_uis() == 0) then
		vim.cmd.quit()
	end
end

vim.api.nvim_create_user_command(
	"Setup",
	function()
		if 0 == vim.fn.isdirectory(paqpath) then
			vim.notify("Installing paq", vim.log.levels.INFO)
			vim.fn.system({
				"git",
				"clone",
				"--depth=1",
				"https://github.com/savq/paq-nvim.git",
				paqpath,
			})
		else
			vim.notify("Paq is already installed\n", vim.log.levels.WARN)
		end
		quit_if_headless()
		vim.notify("Please restart neovim", vim.log.levels.WARN)
	end,
	{ desc = "Installs paq" }
)

vim.api.nvim_create_user_command(
	"UpdatePlugins",
	function()
		Ensure("paq", function(paq)
			local plugins = require("user.plugins") or {}
			vim.api.nvim_create_autocmd("User", {
				pattern = "PaqDoneSync",
				callback = function()
					vim.notify("\nUpdated all plugins\n", vim.log.levels.INFO)
					quit_if_headless()
				end,
			})
			vim.notify("Updating " .. #plugins .. " plugins", vim.log.levels
			.INFO)
			paq(plugins)
			paq:sync()
		end)
	end,
	{ desc = "Updates all plugins" }
)

vim.api.nvim_create_user_command(
	"UpdateParsers",
	function()
		Ensure("nvim-treesitter", function()
			local cmd = {
				cmd = "TSUpdateSync",
				args = require("user.parsers") or {},
			}
			vim.cmd(cmd)
			vim.notify("\nUpdated all parsers\n", vim.log.levels.INFO)
			quit_if_headless()
		end)
	end,
	{ desc = "Updates all TreeSitter parsers" }
)
