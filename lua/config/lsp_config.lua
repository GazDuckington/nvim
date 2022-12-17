vim.opt.signcolumn = 'yes'

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

	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	map("n", "gf", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	map("n", "<leader>sd", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
	map("n", "<leader>sw", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
	map("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
	map("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
	map("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	map("n", "F", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
	map("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

end)

lsp.setup()
