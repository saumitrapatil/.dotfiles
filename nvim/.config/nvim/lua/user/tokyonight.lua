local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
	return
end

tokyonight.setup({
	style = "night",
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
	},
})
-- comment
