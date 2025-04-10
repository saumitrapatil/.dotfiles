return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('tokyonight').setup {
            transparent = false,
        }
        vim.cmd [[colorscheme tokyonight-moon]]
    end,
}

-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			transparent_background = true, -- disables setting the background color.
-- 		})
--
-- 		-- setup must be called before loading
-- 		vim.cmd.colorscheme "catppuccin"
-- 	end,
-- }

-- return {
    -- 'ellisonleao/gruvbox.nvim',
--     priority = 1000,
--     config = function()
--         require('gruvbox').setup {
--             terminal_colors = true, -- add neovim terminal colors
--             undercurl = true,
--             underline = true,
--             bold = true,
--             italic = {
--                 strings = true,
--                 emphasis = true,
--                 comments = true,
--                 operators = false,
--                 folds = true,
--             },
--             strikethrough = true,
--             invert_selection = false,
--             invert_signs = false,
--             invert_tabline = false,
--             invert_intend_guides = false,
--             inverse = true, -- invert background for search, diffs, statuslines and errors
--             contrast = '', -- can be "hard", "soft" or empty string
--             palette_overrides = {},
--             overrides = {},
--             dim_inactive = true,
--             transparent_mode = false,
--         }
--         vim.cmd 'colorscheme gruvbox'
--     end,
-- }
