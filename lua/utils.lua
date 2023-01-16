local M = {}

function M.is_headless()
	return (#vim.api.nvim_list_uis() == 0)
end

function M.quit_if_headless()
	if M.is_headless() then
		vim.cmd.quit()
	end
end

function M.ensure(module, callback)
	local ok, loaded = pcall(require, module)
	if not ok then
		vim.notify_once(
			"Module "
			.. module
			.. " not found. You may want to use :Setup and :UpdatePlugins.",
			vim.log.levels.WARN
		)
		return
	end
	if nil ~= callback then
		callback(loaded)
	end
end

return M
