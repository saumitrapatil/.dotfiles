local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
	local harpoon = require("harpoon")
	harpoon:setup({
		settings = {
			save_on_toggle = true,
			-- save_on_ui_close = true,
		},
	})

	vim.keymap.set("n", "<leader><leader>h", function()
		harpoon:list():append()
	end)
	vim.keymap.set("n", "<leader>h", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end)
end

return M
