local M = {
	"numToStr/Comment.nvim",
	event = "BufRead",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
}

function M.config()
	require("Comment").setup({
		---Add a space b/w comment and the line
		---@type boolean
		padding = true,

		---Whether cursor should stay at the
		---same position. Only works in NORMAL
		---mode mappings
		sticky = true,

		---Lines to be ignored while comment/uncomment.
		---Could be a regex string or a function that returns a regex string.
		---Example: Use '^$' to ignore empty lines
		---@type string|function
		ignore = "^$",

		---Whether to create basic (operator-pending) and extra mappings for NORMAL/VISUAL mode
		---@type table
		mappings = {
			---operator-pending mapping
			---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
			basic = true,
			---Extra mapping
			---Includes `gco`, `gcO`, `gcA`
			extra = true,
		},

		---LHS of line and block comment toggle mapping in NORMAL/VISUAL mode
		---@type table
		toggler = {
			---line-comment toggle
			line = "gcc",
			---block-comment toggle
			block = "gbc",
		},

		---LHS of line and block comment operator-mode mapping in NORMAL/VISUAL mode
		---@type table
		opleader = {
			---line-comment opfunc mapping
			line = "gc",
			---block-comment opfunc mapping
			block = "gb",
		},

		---LHS of extra mappings
		---@type table
		extra = {
			---Add comment on the line above
			above = "gcO",
			---Add comment on the line below
			below = "gco",
			---Add comment at the end of line
			eol = "gcA",
		},

		---Pre-hook, called before commenting the line
		---@type function|nil
		pre_hook = function(...)
			local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
			if loaded and ts_comment then
				return ts_comment.create_pre_hook()(...)
			end
		end,

		---Post-hook, called after commenting is done
		---@type function|nil
		post_hook = nil,
	})
end

return M
