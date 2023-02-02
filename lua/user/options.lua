local o = vim.opt
-- General
o.clipboard = "unnamedplus"
o.confirm = true
o.diffopt = { "closeoff", "filler", "internal", "vertical" }
o.modeline = false
o.mouse = "a"
o.nrformats = { "alpha", "bin", "hex", "unsigned" }
o.report = 0
o.showmode = false
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.switchbuf = "useopen"
o.termguicolors = true
o.updatetime = 250

-- Gutters
o.cmdheight = 0
o.colorcolumn = { 80, 120 }
o.cursorline = true
o.fillchars = {
	foldclose = "",
	foldopen = "",
}
o.foldcolumn = "auto"
o.number = true
o.numberwidth = 1
o.relativenumber = true
o.signcolumn = "auto"

-- Text
o.formatoptions = "cjlnqrt"
o.list = true
o.listchars = {
	extends = "",
	nbsp = "※",
	precedes = "",
	space = "•",
	tab = "<->",
}
o.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
o.showbreak = "☇"
o.showmatch = true

-- Formatting
local tabsize = 4
for _, option in ipairs({ "shiftwidth", "softtabstop", "tabstop" }) do
	o[option] = tabsize
end
o.breakindent = true
o.linebreak = true
o.shiftround = true
o.autoindent = true

-- Search
o.grepprg = "rg --vimgrep"
o.ignorecase = true
o.path = { ".", "**", "," }
o.pumblend = 50
o.smartcase = true

-- Completion
o.complete = { ".", "w", "b", "i" }
o.completeopt = { "menu", "menuone", "noinsert", "noselect", "preview" }
o.wildignorecase = true

-- Misc
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.ts_highlight_lua = true
