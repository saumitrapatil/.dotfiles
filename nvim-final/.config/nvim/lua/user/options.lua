local options = {
	-- Numbers
	number = true, -- enables numbers for lines
	relativenumber = true, -- relative numbers
	-- Split
	splitright = true, -- opens new files on the right side in verticle split
	splitbelow = true, -- opens new files below the current files in horizontal split
	-- indentation
	softtabstop = 4,
	shiftwidth = 4,
	tabstop = 4, -- insert two spaces for a tab(4 by default)
	smartindent = false,
	autoindent = false,
	-- expandtab = true,
	-- Search
	hlsearch = false,
	incsearch = true,
	-- Miscellaneous
	scrolloff = 2, -- threshold for number of lines at top or bottom
	cursorline = true, -- highlight the current line
	termguicolors = true, -- set term gui colors (most terminals support this)
	signcolumn = "yes",
	mouse = "a", -- allows mouse in normal, insert and command line mode
	updatetime = 50,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("setlocal spell")
vim.cmd("set spelllang=nl,en_us")

vim.g.cmp_toggle = true
