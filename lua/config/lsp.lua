local lsp = require("lsp-zero")

-- lsp-zero
lsp.preset("recommended")

lsp.configure("sourcery", {
		init_options = {
				token = os.getenv('SOURCERY_TOKEN')
		}
})

lsp.configure("cssls", {
		filetypes = {
				"css", "scss", "less", "rasi"
		}
})

lsp.configure("emmet_ls", {
		filetypes = vim.g.web_filetypes
})


lsp.configure("lua_ls", {
		settings = {
				Lua = {
						diagnostics = {
								globals = { "vim" }
						}
				}
		}
})

lsp.on_attach(function(client, bufnr)
	if client.name == "eslint" then
		vim.cmd.LspStop("eslint")
		return
	end

	local map = function(m, lhs, rhs)
		local opts = { remap = false, silent = true, buffer = bufnr }
		vim.keymap.set(m, lhs, rhs, opts)
	end

	-- references
	map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>")
	map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>")
	map("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>")
	-- diagnosticso
	map("n", "<leader>lo", "<cmd>lua vim.diagnostic.open_float()<cr>")
	map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
	map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	-- buffer commands
	map("n", "<C-S-i>", "<cmd>lua vim.lsp.buf.format()<cr>")
	map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
	map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	map("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
end)

lsp.setup()
