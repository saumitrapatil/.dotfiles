local M = {
	"utilyre/barbecue.nvim",
	enabled = true,
	dependencies = {
		{
			"SmiteshP/nvim-navic",
		},
	},
}

local icons = require("user.icons").kind

function M.config()
	local barbecue = require("barbecue")

	vim.api.nvim_set_hl(0, "NavicSeparator", { link = "Normal" })

	barbecue.setup({
		---whether to create winbar updater autocmd
		---@type boolean
		create_autocmd = true,
		theme = "tokyonight-night",
		---buftypes to enable winbar in
		---@type table
		include_buftypes = { "" },
		---returns a string to be shown at the end of winbar
		-- param bufnr number
		---@return string
		-- custom_section = function(bufnr)
		--   return ""
		-- end,

		---:help filename-modifiers
		modifiers = {
			---@type string
			-- dirname = ":s?.*??",
			dirname = ":~:.",
			---@type string
			basename = "",
		},
		symbols = {
			---string to be shown at the start of winbar
			---@type string
			prefix = " ",
			---entry separator
			---@type string
			separator = require("user.icons").ui.ChevronRight,
			---string to be shown when buffer is modified
			---@type string
			modified = require("user.icons").ui.BigCircle,
			---string to be shown when context is available but empty
			---@type string
			default_context = "",
		},
		---icons for different context entry kinds
		kinds = {
			Array = icons.Array .. " ",
			Boolean = icons.Boolean .. " ",
			Class = icons.Class .. " ",
			Color = icons.Color .. " ",
			Constant = icons.Constant .. " ",
			Constructor = icons.Constructor .. " ",
			Enum = icons.Enum .. " ",
			EnumMember = icons.EnumMember .. " ",
			Event = icons.Event .. " ",
			Field = icons.Field .. " ",
			File = icons.File .. " ",
			Folder = icons.Folder .. " ",
			Function = icons.Function .. " ",
			Interface = icons.Interface .. " ",
			Key = icons.Key .. " ",
			Keyword = icons.Keyword .. " ",
			Method = icons.Method .. " ",
			Module = icons.Module .. " ",
			Namespace = icons.Namespace .. " ",
			Null = icons.Null .. " ",
			Number = icons.Number .. " ",
			Object = icons.Object .. " ",
			Operator = icons.Operator .. " ",
			Package = icons.Package .. " ",
			Property = icons.Property .. " ",
			Reference = icons.Reference .. " ",
			Snippet = icons.Snippet .. " ",
			String = icons.String .. " ",
			Struct = icons.Struct .. " ",
			Text = icons.Text .. " ",
			TypeParameter = icons.TypeParameter .. " ",
			Unit = icons.Unit .. " ",
			Value = icons.Value .. " ",
			Variable = icons.Variable .. " ",
		},
	})
end

return M
