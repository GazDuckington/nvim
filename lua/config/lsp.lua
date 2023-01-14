local servers = vim.g.must_lsp
local lsp = require('lsp-zero')

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
