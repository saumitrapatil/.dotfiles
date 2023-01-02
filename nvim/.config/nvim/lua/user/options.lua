local options={
	mouse = "a",	 					-- allows mouse in normal, insert and command line mode
	number = true,					-- enables numbers for lines
	splitright = true,			-- opens new files on the right side in verticle split
	splitbelow = true,			-- opens new files below the current files in horizontal split
  shiftwidth = 2,
	tabstop = 4,						-- insert two spaces for a tab(4 by default)
	cursorline = true,			-- highlight the current line
	termguicolors = true,   -- set term gui colors (most terminals support this)
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
