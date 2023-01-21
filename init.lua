function Ensure(module, callback)
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

require("user")
require("commands")
require("diagnostics")
require("extensions")
require("git")
require("lsp")
require("syntax")
require("textobjects")
require("ui")
