local M = {
	{
		"iamcco/markdown-preview.nvim",
		build = "pnpm up && cd app && pnpm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}

return M
