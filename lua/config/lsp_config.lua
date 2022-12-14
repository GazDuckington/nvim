vim.opt.signcolumn = 'yes'

local servers = vim.g.must_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")
local lsp = require('lsp-zero')

lspconfig.sourcery.setup({
	init_options = {
		token = os.getenv('SOURCERY_TOKEN')
	}
})

lspconfig.emmet_ls.setup({
	filetypes = vim.g.web_filetypes
})

require('mason.settings').set({
	ui = {
		border = 'rounded'
	}
})

-- lsp-zero
lsp.preset('recommended')
lsp.ensure_installed(servers)
lsp.setup()

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
