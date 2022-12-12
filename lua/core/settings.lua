local o = vim.opt
local g = vim.g
local cmd = vim.cmd
local api = vim.api

-- global settings
-- default shell
vim.opt_global.shell = "fish"

-- must install lsp servers
g.must_lsp = {
	"sumneko_lua",
	"pyright",
	"gopls",
	"svelte",
	"tsserver",
	"tailwindcss",
	"emmet_ls",
	"marksman",
	"sourcery",
}
-- filetypes for emmet
g.web_filetypes = {
	'html',
	'typescriptreact',
	'javascriptreact',
	'css',
	'sass',
	'scss',
	'less',
	'svelte',
	'markdown'
}
-- options for whichkey
g.ops = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = false, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

g.breadcrumb_enabled = true
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- appearance
o.termguicolors = true
o.cursorline = true
o.laststatus = 3
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"

-- whitespace character
o.list = true
o.listchars = {
	-- tab = ' ',
	tab = '  ',
	trail = '◦',
	space = '•',
	eol = '⮧',
}

-- mouse
o.mouse = "a"
o.hidden = true

-- indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true

-- glrnvim
if g.glrnvim_gui then
	api.nvim_create_autocmd("VimEnter", {
		callback = function()
			cmd('cd %:p:h')
		end
	})
end

-- disable diagnostics inline texts
vim.diagnostic.config({
	virtual_text = false
})

-- Show line diagnostics automatically in hover window
o.updatetime = 250
cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
