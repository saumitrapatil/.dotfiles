local M = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = {
		{
			"hrsh7th/nvim-cmp",
			event = {
				"InsertEnter",
				"CmdlineEnter",
			},
		},
	},
}

function M.config()
	require("nvim-autopairs").setup({
		check_ts = true,
		ts_config = {
			lua = { "string", "source" },
			javascript = { "string", "template_string" },
			java = false,
		},
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
			offset = 0, -- Offset from pattern match
			end_key = "$",
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			check_comma = true,
			highlight = "PmenuSel",
			highlight_grey = "LineNr",
		},
	})

	pcall(function()
		local function on_confirm_done(...)
			require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
		end
		require("cmp").event:off("confirm_done", on_confirm_done)
		require("cmp").event:on("confirm_done", on_confirm_done)
	end)
end

return M
