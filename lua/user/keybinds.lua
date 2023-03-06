local k = vim.keymap.set

-- Scroll and focus center of screen
k({ "n", "v" }, "<C-d>", "<C-d>zz",
	{ desc = "Scroll down and center" })
k({ "n", "v" }, "<C-u>", "<C-u>zz",
	{ desc = "Scroll up and center" })

-- Center search result on screen
k({ "n", "v" }, "n", "nzzzv", { desc = "Search and center" })
k({ "n", "v" }, "N", "Nzzzv", { desc = "Search and center" })

-- Buffer management
k("n", "[b", "<cmd>bNext<cr>", {
	desc = "Previous buffer"
})
k("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
k("n", "<leader>bd", "<cmd>DelBuf<cr>", {
	desc = "Close buffer"
})

-- Don't fill that damn clipboard for nothing
k({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete into the void" })
k({ "n", "v" }, "<leader>x", '"_x', { desc = "Delete character into the void" })
k({ "n", "v" }, "<leader>D", '"_D', {
	desc = "Delete till end of line into the void"
})
k({ "n", "v" }, "<leader>c", '"_c', { desc = "Change into the void" })
k({ "n", "v" }, "<leader>C", '"_C', {
	desc = "Change till end of line into the void"
})

-- Format buffer
k("n", "<leader>f", "<cmd>Format<cr>", {
	desc = "Format whole buffer"
})

-- Keep selection when indenting
k("v", "<", "<gv", { desc = "Keep selection when indenting" })
k("v", ">", ">gv", { desc = "Keep selection when indenting" })

-- Vertical splits
vim.cmd.cabbrev("<expr> H (getcmdtype() == ':') ? 'vert help' : 'h'")
vim.cmd.cabbrev("<expr> V (getcmdtype() == ':') ? 'vsplit' : 'V'")
