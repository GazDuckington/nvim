local o = vim.opt
local g = vim.g
local cmd = vim.cmd
local api = vim.api

-- global settings
vim.opt_global.shell = "fish"
g.must_lsp = {
	"sumneko_lua",
	"jedi_language_server",
	"gopls",
	"svelte",
	"tsserver",
	"tailwindcss",
	"emmet_ls",
	"marksman",
	"sourcery",
}
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
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- appearance
cmd([[highlight WinSeparator guibg=none]])
o.termguicolors = true
o.cursorline = true
o.laststatus = 3
o.relativenumber = true
o.number = true

o.list = true
o.listchars = {
	-- tab = ' ',
	tab = '  ',
	trail = '◦',
	space = '•',
	eol = '↴',
}

-- mouse
cmd([[set mouse+=a]])
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
