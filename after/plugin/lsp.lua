local servers = vim.g.must_lsp
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

lspconfig.sumneko_lua.setup({
	settings = {
		diagnostics = {
			globals = { "vim" }
		}
	}
})

require('mason.settings').set({
	ui = {
		border = 'rounded'
	}
})

-- lsp-zero
lsp.preset('recommended')
lsp.ensure_installed(servers)

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local map = vim.keymap.set

	if client.name == "eslint" then
		vim.cmd.LspStop('eslint')
		return
	end

end)

lsp.setup()
