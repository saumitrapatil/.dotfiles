return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        lazy = false,
        config = function()
            require("user.lsp.attach")
            require("user.lsp.lspconf")
            require("user.lsp.diagnostic")
        end,
    },
    {
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufRead", "BufNew" },
		lazy = true,
		config = function()
			require("user.lsp.null-ls")
		end,
	},
}
