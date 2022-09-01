local servers = vim.g.must_lsp

-- automatically install lang. server
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers
})

-- autoformat on save
require("lsp-format").setup {}
for _,client in ipairs(servers) do
  require("lspconfig")[client].setup({
    on_attach = require "lsp-format".on_attach,
    init_options = { documentFormatting = true }
  })
end
