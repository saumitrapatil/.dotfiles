return {
	"barrett-ruth/live-server.nvim",
    ft="html",
	build = "npm install -g live-server",
	config = function()
		require("live-server").setup()
	end,
}
