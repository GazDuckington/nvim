-- vars
local servers = vim.g.must_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")

-- setup lsp installer
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers
})

-- config all installed servers
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup({
			capabilities = capabilities,
			init_options = {
				documentFormatting = true,
			}
		})
	end,
})
