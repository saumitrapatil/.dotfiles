local lspconfig = require("lspconfig")

local servers = {
	-- name of server = "name of servers executable"
	taplo = "taplo",
	-- lemminx = "lemminx",
	marksman = "marksman",
	-- jdtls = "jdtls",
	bashls = "bash-language-server",
	html = "vscode-html-language-server",
	jsonls = "vscode-json-language-server",
	tsserver = "typescript-language-server",
	pyright = "pyright",
	tailwindcss = "tailwindcss-language-server"
}
for k, v in pairs(servers) do
	if vim.fn.executable(v) == 1 then
		lspconfig[k].setup({
			on_attach = require("rj.lsp.attach").on_attach,
			capabilities = require("rj.lsp.attach").capabilities,
		})
	else
		print("lspconfig: " .. v .. " not found")
	end
end

if vim.fn.executable("lua-language-server") == 1 then
	lspconfig.lua_ls.setup({
		on_attach = require("rj.lsp.attach").on_attach,
		capabilities = require("rj.lsp.attach").capabilities,
		settings = {
			Lua = {
				--hint = {
				--	enable = true,
				--	arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
				--	await = true,
				--	paramName = "Disable", -- "All", "Literal", "Disable"
				--	paramType = false,
				--	semicolon = "Disable", -- "All", "SameLine", "Disable"
				--	setType = true,
				--},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
						checkThirdParty = false,
					},
				},
			},
		},
	})
else
	print("lspconfig: lua-language-server not found")
end

if vim.fn.executable("pyright") == 1 then
	lspconfig.pyright.setup({
		on_attach = require("rj.lsp.attach").on_attach,
		capabilities = require("rj.lsp.attach").capabilities,
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "off",
				},
			},
		},
	})
else
	print("lspconfig: pyright not found")
end
