require("commands/comment")
require("commands/surround")

vim.api.nvim_create_user_command("Format", function()
	require("autoformat").format_whole_file()
end, {
	desc = "Formats whole current buffer, respecting formatexpr and formatprog",
})

vim.api.nvim_create_user_command("Setup", function()
	require("bootstrap").install_paq()
end, {
	desc = "Installs package manager",
})

vim.api.nvim_create_user_command("UpdateAll", function()
	require("bootstrap").update_all()
end, {
	desc = "Updates all plugin, parsers and language servers",
})

vim.api.nvim_create_user_command("UpdatePlugins", function()
	require("bootstrap").update_plugins()
end, {
	desc = "Updates all plugins",
})

vim.api.nvim_create_user_command("UpdateParsers", function()
	require("bootstrap").update_parsers()
end, {
	desc = "Updates all TreeSitter parsers",
})

vim.api.nvim_create_user_command("UpdateServers", function()
	require("bootstrap").update_servers()
end, {
	desc = "Updates all language servers",
})

vim.api.nvim_create_user_command("DelBuf", function()
	local curbuf = vim.api.nvim_get_current_buf()
	vim.cmd.bnext()
	vim.cmd.bdelete(curbuf)
end, {
	desc = "Deletes current buffer without deleting its window",
})
