local options = {
	-- Numbers
	number = true, -- enables numbers for lines
	relativenumber = true, -- relative numbers
	-- Split
	splitright = true, -- opens new files on the right side in verticle split
	splitbelow = true, -- opens new files below the current files in horizontal split
	-- 4 spaced indenting
	softtabstop = 4,
	shiftwidth = 4,
	tabstop = 4, -- insert two spaces for a tab(4 by default)
	expandtab = true,
	-- Search
	hlsearch = false,
	incsearch = true,
	-- Miscellaneous
	scrolloff = 8, -- threshold for number of lines at top or bottom
	cursorline = true, -- highlight the current line
	termguicolors = true, -- set term gui colors (most terminals support this)
	signcolumn = "yes",
	mouse = "a", -- allows mouse in normal, insert and command line mode
	updatetime = 50,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.cmp_toggle = true

------------------ VIM-CLOSETAG ------------------
-- filenames like *.xml, *.html, *.xhtml, ...
-- These are the file extensions where this plugin is enabled.
vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.tsx"

-- filenames like *.xml, *.xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.
vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx,*.tsx"

-- filetypes like xml, html, xhtml, ...
-- These are the file types where this plugin is enabled.
vim.g.closetag_filetypes = "html,xhtml,phtml,tsx"

-- filetypes like xml, xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.
vim.g.closetag_xhtml_filetypes = "xhtml,jsx,tsx"

-- integer value [0|1]
-- This will make the list of non-closing tags case-sensitive
vim.g.closetag_emptyTags_caseSensitive = 1

-- table
-- Disables auto-close if not in a "valid" region (based on filetype)
vim.g.closetag_regions = {
    ['typescript.tsx'] = 'jsxRegion,tsxRegion',
    ['javascript.jsx'] = 'jsxRegion',
    ['typescriptreact'] = 'jsxRegion,tsxRegion',
    ['javascriptreact'] = 'jsxRegion',
}
------------------ VIM-CLOSETAG ------------------
