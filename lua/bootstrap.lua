local B = {}
local U = require("utils")

local _paqpath = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

local function _is_paq_installed()
	return vim.loop.fs_stat(_paqpath)
end

local function _update_plugins(callback)
	U.ensure("paq", function(paq)
		local plugins = require("user/plugins") or {}
		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "PaqDoneSync",
			callback = callback,
		})
		vim.notify("Updating " .. #plugins .. " plugins", vim.log.levels.INFO)
		paq(plugins)
		paq:sync()
	end)
end

local function _update_parsers(callback)
	U.ensure("nvim-treesitter", function()
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
		callback()
	end)
end

local function _update_servers(callback)
	U.ensure("mason", function()
		local servers = require("user/servers") or {}
		local nb = #servers
		vim.notify("Updating " .. nb .. " servers", vim.log.levels.INFO)
		for index, item in ipairs(servers) do
			vim.notify(
				"\nUpdating " .. index .. "/" .. nb .. ": " .. item .. "\t",
				vim.log.levels.INFO
			)
			vim.cmd.MasonInstall(item)
		end
		callback()
	end)
end

function B.install_paq()
	if not _is_paq_installed() then
		vim.notify("Installing paq", vim.log.levels.INFO)
		vim.fn.system({
			"git",
			"clone",
			"--depth=1",
			"https://github.com/savq/paq-nvim.git",
			_paqpath,
		})
		vim.notify("Paq installed", vim.log.levels.INFO)
	else
		vim.notify("Paq is already installed\n", vim.log.levels.WARN)
	end
	U.quit_if_headless()
	vim.notify("Please restart neovim", vim.log.levels.WARN)
end

function B.update_plugins()
	_update_plugins(function()
		vim.notify("\nUpdated all plugins\n", vim.log.levels.INFO)
		U.quit_if_headless()
	end)
end

function B.update_parsers()
	_update_parsers(function()
		vim.notify("\nUpdated all parsers\n", vim.log.levels.INFO)
		U.quit_if_headless()
	end)
end

function B.update_servers()
	_update_servers(function()
		vim.notify("\nUpdated all servers\n", vim.log.levels.INFO)
		U.quit_if_headless()
	end)
end

function B.update_all()
	_update_plugins(function()
		vim.notify("\nUpdated all plugins\n", vim.log.levels.INFO)
		_update_parsers(function()
			vim.notify("\nUpdated all parsers\n", vim.log.levels.INFO)
			B.update_servers()
			U.quit_if_headless()
		end)
	end)
end

return B
