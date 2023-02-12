local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
	return
end

barbecue.setup({
	---whether to attach navic to language servers automatically
	---@type boolean
	attach_navic = true,

	---whether to create winbar updater autocmd
	---@type boolean
	create_autocmd = true,

	---buftypes to enable winbar in
	---@type string[]
	include_buftypes = { "" },

	---filetypes not to enable winbar in
	---@type string[]
	exclude_filetypes = { "gitcommit", "toggleterm" },

	modifiers = {
		---filename modifiers applied to dirname
		---@type string
		dirname = ":~:.",

		---filename modifiers applied to basename
		---@type string
		basename = "",
	},

	---whether to display path to file
	---@type boolean
	show_dirname = true,

	---whether to replace file icon with the modified symbol when buffer is modified
	---@type boolean
	show_modified = false,

	---whether to show/use navic in the winbar
	---@type boolean
	show_navic = true,

	---returns a string to be shown at the end of winbar
	---@type fun(bufnr: number): string
	custom_section = function()
		return ""
	end,

	---`auto` uses your current colorscheme's theme or generates a theme based on it
	---`string` is the theme name to be used (theme should be located under `barbecue.theme` module)
	---`barbecue.Theme` is a table that overrides the `auto` theme detection/generation
	--@type "auto"|string|barbecue.Theme
	theme = "auto",

	symbols = {
		---modification indicator
		---@type string
		modified = "●",

		---truncation indicator
		---@type string
		ellipsis = "…",

		---entry separator
		---@type string
		separator = "",
	},

	---icons for different context entry kinds
	---`false` to disable kind icons
	---@type table<string, string>|false
	kinds = {
		Array = "",
		Boolean = "蘒",
		Class = "",
		Color = "",
		Constant = "",
		Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "",
		File = "",
		Folder = "",
		Function = "",
		Interface = "",
		Key = "",
		Keyword = "",
		Method = "",
		Module = "",
		Namespace = "",
		Null = "ﳠ",
		Number = "",
		Object = "",
		Operator = "",
		Package = "",
		Property = "",
		Reference = "",
		Snippet = "",
		String = "",
		Struct = "",
		Text = "",
		TypeParameter = "",
		Unit = "",
		Value = "",
		Variable = "",
	},
})
