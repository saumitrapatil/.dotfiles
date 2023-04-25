local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	stages = "slide",
	timeout = 3000,
})

vim.notify = require("notify")
