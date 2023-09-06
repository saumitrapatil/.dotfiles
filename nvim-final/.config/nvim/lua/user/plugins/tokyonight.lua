return {
    "folke/tokyonight.nvim",
    enabled = true,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
}
