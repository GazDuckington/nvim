local servers = vim.g.must_lsp
local lspconfig = require("lspconfig")
local lsp = require('lsp-zero')

lspconfig.sourcery.setup({
	init_options = {
		token = os.getenv('SOURCERY_TOKEN')
	}
})

-- lsp-zero
lsp.preset('recommended')
lsp.ensure_installed(servers)

lsp.on_attach(function(client)
	if client.name == "eslint" then
		vim.cmd.LspStop('eslint')
		return
	end

end)

lsp.setup()
