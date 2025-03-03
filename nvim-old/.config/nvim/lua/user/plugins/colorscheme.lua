return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  opts = {},
}

-- local M = {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- }

-- function M.config()
-- 	require("gruvbox").setup({
-- 		overrides = {
-- 			SignColumn = { bg = "#282828" },
-- 		},
-- 	})
-- 	vim.cmd("colorscheme gruvbox")
-- end

-- return M

-- return {
-- 	"catppuccin/nvim",
-- 	enabled = true,
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd([[colorscheme catppuccin-macchiato]])
-- 	end,
-- }
