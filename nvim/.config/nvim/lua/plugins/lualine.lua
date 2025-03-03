return{
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local diagnostics = {
			'diagnostics',
			sources = { 'nvim_diagnostic' },
			sections = { 'error', 'warn' },
			symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
			colored = false,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diff = {
			'diff',
			colored = false,
			symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
			cond = hide_in_width,
		}

		require('lualine').setup{
			options = {
				icons_enabled = true,
				theme = "auto",
				--          
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
				disabled_filetypes = { 'alpha', 'neo-tree' },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch' },
				lualine_c = { 'filename' },
				lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
				lualine_y = { 'location' },
				lualine_z = { 'progress' },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { 'filename', path = 1 } },
				lualine_x = { { 'location', padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { 'fugitive' },
		}
	end
}
