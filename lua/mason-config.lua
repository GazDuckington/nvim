-- vars
local servers = vim.g.must_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")

-- setup lsp installer
require("mason").setup({
	-- providers = {
	-- "mason.providers.client",
	-- "mason.providers.registry-api"
	-- }
})
require("mason-lspconfig").setup({
	ensure_installed = servers
})

-- config all installed servers
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup({
			automatic_installation = true,
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
		})
	end,
})
