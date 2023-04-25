require('ayu').setup({
	theme = 'dark',
	transparent = true,
	term_colors = true,
	overrides = {
		SignColumn = { bg = "none" },
		Constant = { fg = "#f66565" },
		Keyword = { fg = "#8e95fd" },
		Number = { fg = "#ef9ad5" },
		Operator = { fg = "#f66565" },
	}
})
