local M = {}
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

function M.install_paq()
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

function M.update_plugins()
	_update_plugins(function()
		vim.notify("\nUpdated all plugins\n", vim.log.levels.INFO)
		U.quit_if_headless()
	end)
end

function M.update_parsers()
	_update_parsers(function()
		vim.notify("\nUpdated all parsers\n", vim.log.levels.INFO)
		U.quit_if_headless()
	end)
end

function M.update_all()
	_update_plugins(function()
		vim.notify("\nUpdated all plugins\n", vim.log.levels.INFO)
		M.update_parsers()
		U.quit_if_headless()
	end)
end

return M
