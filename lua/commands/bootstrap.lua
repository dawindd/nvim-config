local paqpath = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

local function quit_if_headless()
	if (#vim.api.nvim_list_uis() == 0) then
		vim.cmd.quit()
	end
end

function install_paq()
	if not vim.loop.fs_stat(paqpath) then
		vim.notify("Installing paq", vim.log.levels.INFO)
		vim.fn.system({
			"git",
			"clone",
			"--depth=1",
			"https://github.com/savq/paq-nvim.git",
			paqpath,
		})
		vim.notify("Paq installed", vim.log.levels.INFO)
	else
		vim.notify("Paq is already installed\n", vim.log.levels.WARN)
	end
	quit_if_headless()
	vim.notify("Please restart neovim", vim.log.levels.WARN)
end

local function update_plugins(callback)
	Ensure("paq", function(paq)
		local plugins = require("user/plugins") or {}
		vim.api.nvim_create_autocmd("User", {
			pattern = "PaqDoneSync",
			callback = function()
				vim.notify("\nUpdated all plugins\n", vim.log.levels.INFO)
				quit_if_headless()
			end,
		})
		vim.notify("Updating " .. #plugins .. " plugins", vim.log.levels.INFO)
		paq(plugins)
		paq:sync()
	end)
end

local function update_parsers(callback)
	Ensure("nvim-treesitter", function()
		local parsers = require("user/parsers") or {}
		local nb = #parsers
		vim.notify("Updating " .. nb .. " parsers", vim.log.levels.INFO)
		for index, item in ipairs(parsers) do
			vim.notify(
				"\nUpdating " .. index .. "/" .. nb .. ": " .. item .. "\t",
				vim.log.levels.INFO
			)
			vim.cmd.TSUpdateSync(item)
		end
		vim.notify("\nUpdated all parsers\n", vim.log.levels.INFO)
		quit_if_headless()
	end)
end

-- Commands
vim.api.nvim_create_user_command("Setup",
	function()
		install_paq()
	end,
	{ desc = "Installs package manager" }
)
vim.api.nvim_create_user_command("UpdatePlugins",
	function()
		update_plugins()
	end,
	{ desc = "Updates all plugins", }
)
vim.api.nvim_create_user_command("UpdateParsers", function()
	update_parsers()
end, {
	desc = "Updates all TreeSitter parsers",
})
