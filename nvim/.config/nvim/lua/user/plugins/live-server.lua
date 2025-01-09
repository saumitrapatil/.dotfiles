return {
	"barrett-ruth/live-server.nvim",
	build = 'pnpm add -g live-server',
    ft="html",
	config = function()
		require("live-server").setup()
	end,
}
