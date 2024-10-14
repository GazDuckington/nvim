local lsp_zero = require("lsp-zero")
local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format({ details = true })
local luasnip = require("luasnip")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

-- lsp-zero
lsp_zero.configure("lua_ls", {
	cmd = { 'lua-language-server' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = { "vim" }
			},
			telemetry = {
				enable = false,
			},
		}
	}
})

lsp_zero.configure("cssls", {
	filetypes = {
		"css", "scss", "less", "rasi"
	}
})

lsp_zero.configure("emmet_ls", {
	filetypes = vim.g.web_filetypes,
	root_dir = function(fname)
		return vim.loop.cwd()
	end
})


lsp_zero.on_attach(function(client, bufnr)
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

cmp.setup({
	sources = {
		-- { name = 'codeium' },
		{ name = 'sourcery' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
		{ name = 'emmet_ls' },
		{ name = 'goimports' },
		{ name = 'gopls' },
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-y>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),
	}),
	formatting = cmp_format,
})

-- autoformat on save
lsp_zero.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['ruff'] = { 'python' },
		['lua_ls'] = { 'lua' },
		-- ['black'] = { 'python' },
		['shellcheck'] = { 'bash', 'zsh', 'sh' },
		['goimport'] = { 'go' },
		['gopls'] = { 'go' },
	}
})
lsp_zero.setup()
