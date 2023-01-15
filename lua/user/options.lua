-- General
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.diffopt = { "closeoff", "filler", "internal", "vertical" }
vim.opt.modeline = false
vim.opt.mouse = "a"
vim.opt.nrformats = { "alpha", "bin", "hex", "unsigned" }
vim.opt.report = 0
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.switchbuf = "split"
vim.opt.termguicolors = true
vim.opt.updatetime = 250

-- Gutters
vim.opt.cmdheight = 0
vim.opt.colorcolumn = { 80, 120 }
vim.opt.cursorline = true
vim.opt.fillchars = {
	foldclose = "",
	foldopen = "",
	horiz = "━",
	horizdown = "┳",
	horizup = "┻",
	vert = "┃",
	verthoriz = "╋",
	vertleft = "┨",
	vertright = "┣",
}
vim.opt.foldcolumn = "auto"
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.signcolumn = "auto"

-- Text
vim.opt.formatoptions = "cjlnqrt"
vim.opt.list = true
vim.opt.listchars = {
	extends = "",
	nbsp = "※",
	precedes = "",
	space = "•",
	tab = "<->",
}
vim.opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
vim.opt.showbreak = "☇"
vim.opt.showmatch = true

-- Formatting
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.tildeop = true

-- Search
vim.opt.browsedir = "current"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.path = { ".", "**", "," }
vim.opt.pumblend = 50
vim.opt.smartcase = true

-- Completion
vim.opt.complete = { ".", "w", "b", "i" }
vim.opt.completeopt = { "menuone", "noinsert", "noselect", "preview" }
vim.opt.wildignorecase = true

-- Misc
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.ts_highlight_lua = true
