local M = {
	"hrsh7th/nvim-cmp",
	event = {
		"InsertEnter",
		"CmdlineEnter",
	},
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		{
			"hrsh7th/cmp-buffer",
			event = "InsertEnter",
		},
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		{
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip.loaders.from_lua").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_snipmate").lazy_load()
			end,
			event = "InsertEnter",
			dependencies = {
				{ "rafamadriz/friendly-snippets", lazy = true },
			},
		},
		{
			"jcdickinson/codeium.nvim",
			enabled = false,
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("codeium").setup({})
			end,
		},
		{
			"roobert/tailwindcss-colorizer-cmp.nvim",
			-- optionally, override the default options:
			config = function()
				require("tailwindcss-colorizer-cmp").setup({
					color_square_width = 2,
				})
			end,
		},
	},
}
M.methods = {}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
M.methods.has_words_before = has_words_before

---@deprecated use M.methods.has_words_before instead
M.methods.check_backspace = function()
	return not has_words_before()
end

local T = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function feedkeys(key, mode)
	vim.api.nvim_feedkeys(T(key), mode, true)
end

M.methods.feedkeys = feedkeys

---when inside a snippet, seeks to the nearest luasnip field if possible, and checks if it is jumpable
---@param dir number 1 for forward, -1 for backward; defaults to 1
---@return boolean true if a jumpable luasnip field is found while inside a snippet
local function jumpable(dir)
	local luasnip_ok, luasnip = pcall(require, "luasnip")
	if not luasnip_ok then
		return false
	end

	local win_get_cursor = vim.api.nvim_win_get_cursor
	local get_current_buf = vim.api.nvim_get_current_buf

	---sets the current buffer's luasnip to the one nearest the cursor
	---@return boolean true if a node is found, false otherwise
	local function seek_luasnip_cursor_node()
		-- TODO(kylo252): upstream this
		-- for outdated versions of luasnip
		if not luasnip.session.current_nodes then
			return false
		end

		local node = luasnip.session.current_nodes[get_current_buf()]
		if not node then
			return false
		end

		local snippet = node.parent.snippet
		local exit_node = snippet.insert_nodes[0]

		local pos = win_get_cursor(0)
		pos[1] = pos[1] - 1

		-- exit early if we're past the exit node
		if exit_node then
			local exit_pos_end = exit_node.mark:pos_end()
			if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		node = snippet.inner_first:jump_into(1, true)
		while node ~= nil and node.next ~= nil and node ~= snippet do
			local n_next = node.next
			local next_pos = n_next and n_next.mark:pos_begin()
			local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
				or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

			-- Past unmarked exit node, exit early
			if n_next == nil or n_next == snippet.next then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end

			if candidate then
				luasnip.session.current_nodes[get_current_buf()] = node
				return true
			end

			local ok
			ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
			if not ok then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		-- No candidate, but have an exit node
		if exit_node then
			-- to jump to the exit node, seek to snippet
			luasnip.session.current_nodes[get_current_buf()] = snippet
			return true
		end

		-- No exit node, exit from snippet
		snippet:remove_from_jumplist()
		luasnip.session.current_nodes[get_current_buf()] = nil
		return false
	end

	if dir == -1 then
		return luasnip.in_snippet() and luasnip.jumpable(-1)
	else
		return luasnip.in_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable(1)
	end
end

M.methods.jumpable = jumpable

function M.config()
	local status_cmp_ok, cmp_types = pcall(require, "cmp.types.cmp")
	if not status_cmp_ok then
		return
	end
	local ConfirmBehavior = cmp_types.ConfirmBehavior
	local SelectBehavior = cmp_types.SelectBehavior

	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local cmp_window = require("cmp.config.window")
	local cmp_mapping = require("cmp.config.mapping")
	local kind_icons = require("user.icons").kind

	cmp.setup({
		enabled = function()
			return vim.g.cmp_toggle
		end,
		confirm_opts = {
			behavior = ConfirmBehavior.Replace,
			select = false,
		},
		completion = {
			---@usage The minimum length of a word to complete on.
			keyword_length = 1,
		},
		experimental = {
			ghost_text = false,
			native_menu = false,
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			max_width = 0,
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
				-- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				vim_item.menu = ({
					nvim_lsp = "(LSP)",
					emoji = "(Emoji)",
					path = "(Path)",
					calc = "(Calc)",
					cmp_tabnine = "(Tabnine)",
					vsnip = "(Snippet)",
					luasnip = "(Snippet)",
					buffer = "(Buffer)",
					tmux = "(TMUX)",
					copilot = "(Copilot)",
					treesitter = "(TreeSitter)",
					nvim_lua = "(NVIM_LUA)",
					codeium = "(Codeium)",
				})[entry.source.name]

				return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
				-- return vim_item
			end,
			duplicates = {
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
				luasnip = 1,
			},
			duplicates_default = 0,
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp_window.bordered(),
			documentation = cmp_window.bordered(),
		},
		sources = {
			{
				name = "copilot",
				-- keyword_length = 0,
				max_item_count = 3,
				trigger_characters = {
					{
						".",
						":",
						"(",
						"'",
						'"',
						"[",
						",",
						"#",
						"*",
						"@",
						"|",
						"=",
						"-",
						"{",
						"/",
						"\\",
						"+",
						"?",
						" ",
						-- "\t",
						-- "\n",
					},
				},
			},
			{
				name = "nvim_lsp",
				entry_filter = function(entry, ctx)
					local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
					if kind == "Snippet" and ctx.prev_context.filetype == "java" then
						return false
					end
					return true
				end,
			},

			{ name = "path" },
			{ name = "luasnip" },
			{ name = "cmp_tabnine" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
			{ name = "calc" },
			{ name = "emoji" },
			{ name = "treesitter" },
			{ name = "crates" },
			{ name = "tmux" },
		},
		mapping = cmp_mapping.preset.insert({
			["<C-k>"] = cmp_mapping(cmp_mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp_mapping(cmp_mapping.select_next_item(), { "i", "c" }),
			["<Down>"] = cmp_mapping(cmp_mapping.select_next_item({ behavior = SelectBehavior.Select }), { "i" }),
			["<Up>"] = cmp_mapping(cmp_mapping.select_prev_item({ behavior = SelectBehavior.Select }), { "i" }),
			["<C-d>"] = cmp_mapping.scroll_docs(-4),
			["<C-f>"] = cmp_mapping.scroll_docs(4),
			["<C-y>"] = cmp_mapping({
				i = cmp_mapping.confirm({ behavior = ConfirmBehavior.Replace, select = false }),
				c = function(fallback)
					if cmp.visible() then
						cmp.confirm({ behavior = ConfirmBehavior.Replace, select = false })
					else
						fallback()
					end
				end,
			}),
			["<Tab>"] = cmp_mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				elseif jumpable(1) then
					luasnip.jump(1)
				elseif has_words_before() then
					-- cmp.complete()
					fallback()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp_mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-Space>"] = cmp_mapping.complete(),
			["<C-e>"] = cmp_mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
	})
end

return M
