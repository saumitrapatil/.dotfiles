local M = {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
}

function M.config()
	local ls = require("luasnip")
	local s = ls.snippet
	local i = ls.insert_node
	local fmt = require("luasnip.extras.fmt").fmt

	ls.add_snippets("c", {
		s(
			"cc",
			fmt(
				[[
#include <stdio.h>

int main() {{
	{}
    return 0;
}}
]],
				{
					i(1),
				}
			)
		),
	})
end

return M
