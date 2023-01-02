return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim", "PACKER_BOOTSTRAP" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
