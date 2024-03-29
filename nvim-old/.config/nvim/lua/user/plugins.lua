-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("windwp/nvim-autopairs") -- brackets
	use("numToStr/Comment.nvim") -- auto commenting on keybinds
	use("lewis6991/impatient.nvim") -- reduces loading time of vim
	use("lukas-reineke/indent-blankline.nvim") -- indentation guide lines
	use("RRethy/vim-illuminate") -- highlights other uses of the word
	use("rcarriga/nvim-notify") -- notification manager
	use("akinsho/toggleterm.nvim")
	use("tpope/vim-fugitive")
	use("stevearc/aerial.nvim")
	use("NvChad/nvim-colorizer.lua")

	-- Colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("folke/tokyonight.nvim")
	use("lunarvim/horizon.nvim")

	-- Completetions
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- NvimTree
	use("nvim-tree/nvim-web-devicons")
	use("nvim-tree/nvim-tree.lua")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Barbecue
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	})
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})

	-- DAP(Debugger Adapter Protocol)
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("folke/neodev.nvim")

	-- Discord RPC
	use("andweeb/presence.nvim")

	-- Transparency
	use("xiyaowong/nvim-transparent")

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		--[[ opt = true, ]]
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Code Time
	use("wakatime/vim-wakatime")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
