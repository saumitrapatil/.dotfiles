local M = {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}

function M.config()
	require("aerial").setup({
		layout = {
			max_width = { 0.6 },
			min_width = 40,
		},

		-- optionally use on_attach to set keymaps when aerial has attached to a buffer
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
	})
	-- You probably also want to set a keymap to toggle aerial
	vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
end

return M
