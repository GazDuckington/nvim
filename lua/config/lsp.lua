local servers = vim.g.must_lsp
local lsp = require('lsp-zero')

-- lsp-zero
lsp.preset('recommended')
lsp.ensure_installed(servers)

lsp.on_attach(function(client, bufnr)
	if client.name == "eslint" then
		vim.cmd.LspStop('eslint')
		return
	end

	local map = function(m, lhs, rhs)
		local opts = { remap = false, silent = true, buffer = bufnr }
		vim.keymap.set(m, lhs, rhs, opts)
	end
	-- references
	map("n", "<leader>tr", "<cmd>Telescope lsp_references<cr>")
	map("n", "<leader>sd", "<cmd>Telescope lsp_document_symbols<cr>")
	map("n", "<leader>sw", "<cmd>Telescope lsp_workspace_symbols<cr>")
	-- diagnosticso
	map("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<cr>")
	map("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
	map("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	-- buffer commands
	map("n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<cr>")
	map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
	map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	map("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
end)


lsp.configure('sumneko_lua', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})


lsp.configure('sumneko_lua', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
})

lsp.setup()
