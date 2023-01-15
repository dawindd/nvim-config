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

function M.reload(module)
	package.loaded[module] = nil
	M.ensure(module)
end

function M.get_loaded_buffers()
	return vim.tbl_filter(function(buffer)
		return 1 == vim.fn.buflisted(buffer)
	end, vim.api.nvim_list_bufs())
end

return M
