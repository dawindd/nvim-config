-- Scroll and focus center of screen
vim.keymap.set({ "n" }, "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set({ "n" }, "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Center search result on screen
vim.keymap.set({ "n" }, "n", "nzzzv", { desc = "Search and center" })
vim.keymap.set({ "n" }, "N", "Nzzzv", { desc = "Search and center" })
vim.keymap.set({ "n", "v" }, "<leader>:", "<cmd>noh<cr>", {
	desc = "Remove search highlight"
})

-- Buffer management
vim.keymap.set({ "n", "v" }, "[b", "<cmd>bNext<cr>", {
	desc = "Previous buffer"
})
vim.keymap.set({ "n", "v" }, "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set({ "n", "v" }, "<leader>bd", "<cmd>DelBuf<cr>", {
	desc = "Close buffer"
})

-- Don't fill that damn clipboard for nothing
vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete into the void" })
vim.keymap.set({ "n", "v" }, "D", '"_D', {
	desc = "Delete till end of line into the void"
})
vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "Change into the void" })
vim.keymap.set({ "n", "v" }, "C", '"_C', {
	desc = "Change till end of line into the void"
})

-- Format buffer
vim.keymap.set({ "n" }, "<leader>f", "<cmd>Format<cr>", {
	desc = "Format whole buffer"
})

-- Keep selection when indenting
vim.keymap.set({ "v" }, "<", "<gv", { desc = "Keep selection when indenting" })
vim.keymap.set({ "v" }, ">", ">gv", { desc = "Keep selection when indenting" })

-- Vertical splits
vim.cmd.cabbrev("<expr> H (getcmdtype() == ':') ? 'vert help' : 'h'")
vim.cmd.cabbrev("<expr> V (getcmdtype() == ':') ? 'vsplit' : 'V'")

-- Tab to complete
vim.keymap.set({ "i" }, "<c-tab>", "<c-x><c-o>", { desc = "Tab to complete" })
