require("commands/bootstrap")
require("commands/comment")
require("commands/format")
require("commands/surround")

vim.api.nvim_create_user_command("DelBuf", function()
	local curbuf = vim.api.nvim_get_current_buf()
	vim.cmd.bnext()
	vim.cmd.bdelete(curbuf)
end, {
	desc = "Deletes current buffer without deleting its window",
})
