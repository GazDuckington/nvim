local lsp = require("lsp-zero")
local servers = vim.g.must_lsp

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
	map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>")
	map("n", "<leader>ld", "<cmd>Telescope lsp_document_symbols<cr>")
	map("n", "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>")
	-- diagnosticso
	map("n", "<leader>lo", "<cmd>lua vim.diagnostic.open_float()<cr>")
	map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
	map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	-- buffer commands
	map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>")
	map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
	map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	map("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
end)

lsp.configure('sourcery', {
	init_options = {
		token = os.getenv('SOURCERY_TOKEN')
	}
})

lsp.configure('cssls', {
	filetypes = {
		"css", "scss", "less", "rasi"
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

-- null-ls
local pretty_ft = TableConcat(vim.g.web_filetypes, { "json", "yaml", "toml", "rasi" })
local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.prettierd.with({
		filetypes = pretty_ft
	}),
}

null_ls.setup({ sources = sources })
