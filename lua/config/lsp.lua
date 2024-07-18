local lsp = require("lsp-zero")
local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp_mappings = {
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

	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			if #cmp.get_entries() == 1 then
				cmp.confirm({ select = true })
			else
				cmp.select_next_item()
			end
		elseif luasnip.locally_jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
}
cmp.setup({
	mapping = cmp_mappings
})

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
	filetypes = vim.g.web_filetypes,
	root_dir = function(fname)
		return vim.loop.cwd()
	end
})

-- lsp.configure("ruff_lsp", {})

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

lsp.setup_nvim_cmp({
	sources = {
		{ name = 'codeium', keyword_length = 2 },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'buffer',  keyword_length = 3 },
		{ name = 'luasnip', keyword_length = 2 },
		{ name = 'emmet_ls' }
	},
	mapping = cmp_mappings,
})

-- autoformat on save
lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['tsserver'] = { 'javascript', 'typescript' },
		['ruff'] = { 'python' },
		['lua_ls'] = { 'lua' },
		-- ['black'] = { 'python' },
		['shellcheck'] = { 'bash', 'zsh', 'sh' },
		['goimport'] = { 'go' },
		['gopls'] = { 'go' },
	}
})
lsp.setup()
