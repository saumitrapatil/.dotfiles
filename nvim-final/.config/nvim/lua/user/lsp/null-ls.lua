local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

require("null-ls").setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_args = { "--use-tabs", "--tab-width 4", "--no-semi", "--single-quote", "--jsx-single-quote" },
			filetypes = {
				"jsonc",
				"toml",
				-- "javascript",
				-- "javascriptreact",
				-- "typescript",
				-- "typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
				"toml",
			},
		}),
		formatting.black,
		formatting.stylua,
		formatting.beautysh,
		diagnostics.zsh,
		formatting.rustfmt,
	},
})
