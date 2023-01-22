local M = {}

function M.find_root(root_files)
	local path = vim.fs.find(root_files, { upward = true })[1]
	if path ~= nil then
		return vim.fs.dirname(path)
	end
	return vim.fn.getcwd()
end

return M
