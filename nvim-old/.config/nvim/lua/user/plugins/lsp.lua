return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
		config = function()
			require("user.lsp.attach")
			require("user.lsp.lsp-conf")
			require("user.lsp.diagnostic")
		end,
	},
	-- {
	-- 	"p00f/clangd_extensions.nvim",
	-- 	ft = { "c", "cpp" },
	-- 	commit = "52b7e6f1d27de19e30e0c9e492b650f934be3f5e",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("user.lsp.clangd")
	-- 	end,
	-- },
	-- {
	-- 	"Ciel-MC/rust-tools.nvim",
	-- 	-- branch = "inline-inlay-hints",
	-- 	ft = { "rust" },
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("user.lsp.rust-tools")
	-- 	end,
	-- },
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufRead", "BufNew" },
		lazy = true,
		config = function()
			require("user.lsp.null-ls")
		end,
	},
}
