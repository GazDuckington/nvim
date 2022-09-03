local servers = vim.g.must_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- automatically install lang. server
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers
})

require("lspconfig").emmet_ls.setup({
	filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte', 'markdown' },
})

for _, client in ipairs(servers) do
	require("lspconfig")[client].setup({
		capabilities = capabilities,
		init_options = { documentFormatting = true }
	})
end
