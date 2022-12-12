-- vars
local servers = vim.g.must_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")

lspconfig.sourcery.setup({
	init_options = {
		token = os.getenv('SOURCERY_TOKEN')
	}
})

lspconfig.emmet_ls.setup({
	filetypes = vim.g.web_filetypes
})

-- lsp-zero
require('mason.settings').set({
	ui = {
		border = 'rounded'
	}
})

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

require("mason-lspconfig").setup({
	ensure_installed = servers
})

-- config all installed servers
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup({
			automatic_installation = true,
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
