local M = {}

function M.find_root(root_files)
	local path = vim.fs.find(root_files, { upward = true })[1]
	if path ~= nil then
		return vim.fs.dirname(path)
	end
	return vim.fn.getcwd()
end

function M.get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

return M
