return {
	'akinsho/bufferline.nvim',
	dependencies = {
		'moll/vim-bbye',
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		-- local icons = require('icons')
		require('bufferline').setup{
			options = {
				numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
				close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil,
			}
		}
	end
}
