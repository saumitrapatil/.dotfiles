return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window
		{
			's1n7ax/nvim-window-picker',
			version = '2.*',
			config = function()
				require('window-picker').setup {
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { 'terminal', 'quickfix' },
						},
					},
				}
			end,
		},
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree focus toggle<cr>", desc = "NeoTree" },
	},
	config = function()
		vim.fn.sign_define("DiagnosticSignError",
		{text = " ", texthl = "DiagnosticSignError"})
		vim.fn.sign_define("DiagnosticSignWarn",
		{text = " ", texthl = "DiagnosticSignWarn"})
		vim.fn.sign_define("DiagnosticSignInfo",
		{text = " ", texthl = "DiagnosticSignInfo"})
		vim.fn.sign_define("DiagnosticSignHint",
		{text = "󰌵", texthl = "DiagnosticSignHint"})
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
			sort_case_insensitive = false, -- used when sorting files and directories in the tree
			sort_function = nil,
			source_selector = {
				winbar = true,
				content_layout = "center",
				sources = {
					{ source = "filesystem", display_name = " 󰈔 File" },
					{ source = "buffers", display_name = " Buffers" },
					{ source = "git_status", display_name = "  Git" },
				},
			},
			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 2,
					padding = 1, -- extra padding on left hand side
					-- indent guides
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					-- expander config, needed for nesting files
					with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},

				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					highlight = "NeoTreeFileIcon",
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "", -- this can only be used in the git_status source
						renamed = '󰁕', -- this can only be used in the git_status source
						-- Status type
						untracked = "U",
						ignored = "◌",
						unstaged = '󰄱',
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				position = "left",
				width = 33,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["<LeftMouse>"] = "open",
					["<cr>"] = "open",
					["h"] = "navigate_up",
					["l"] = "open",
					["P"] = { "toggle_preview", config = { use_float = true } },
					["<esc>"] = "revert_preview",
					["h"] = "toggle_hidden",
					["sh"] = "open_split",
					["sv"] = "open_vsplit",
					["z"] = "close_all_nodes",
					["d"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
					["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add":
					["q"] = "close_window",
					["R"] = "refresh",
					["?"] = "show_help",
					["<"] = "prev_source",
					[">"] = "next_source",
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = true, -- only works on Windows for hidden files/directories
				},
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = false,
			},
			git_status = {
				window = {
					position = "float",
					mappings = {
						["A"] = "git_add_all",
						["gu"] = "git_unstage_file",
						["ga"] = "git_add_file",
						["gr"] = "git_revert_file",
						["gc"] = "git_commit",
						["gp"] = "git_push",
						["gg"] = "git_commit_and_push",
					},
				},
			},

		})
	end

}
