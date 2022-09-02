local servers = vim.g.must_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- autoformat on save
require("lsp-format").setup {}
-- automatically install lang. server
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers
})

require("lspconfig").emmet_ls.setup({
	filetypes = { '*' },
})

for _,client in ipairs(servers) do
  require("lspconfig")[client].setup({
		capabilities = capabilities,
		on_attach = require "lsp-format".on_attach,
    init_options = { documentFormatting = true }
  })
end
