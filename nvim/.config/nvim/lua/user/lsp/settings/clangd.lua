local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-8" }
return {
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}
