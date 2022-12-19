local o = vim.opt
local g = vim.g
local cmd = vim.cmd

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
	"eslint",
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
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = false,
	noremap = true,
	nowait = false,
}
-- keymap options
g.mapleader = " "
g.opts = { noremap = true, silent = true }
g.breadcrumb_enabled = true
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-- end of global settings

-- appearance
o.termguicolors = true
o.cursorline = true
o.laststatus = 3
o.number = true
o.relativenumber = true
o.guifont = { "FiraCode Nerd Font", ":h10" }

o.path = { "." }
o.signcolumn = "yes"
cmd.set("clipboard+=unnamedplus")
o.updatetime = 250
o.scrolloff = 8

-- whitespace character
o.list = true
o.listchars = {
	-- tab = ' ',
	tab = '  ',
	trail = '◦',
	space = '•',
	eol = '',
}

-- mouse
o.mouse = "a"
o.hidden = true

-- search
o.hlsearch = false
o.incsearch = true

-- indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true

-- undo
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- disable diagnostics inline texts
vim.diagnostic.config({
	virtual_text = true,
	float = {
		source = 'always',
		border = 'rounded',
	}
})

-- for glrnvim
if g.glrnvim_gui or g.neovide then
	cmd([[cd %:p:h]])
end
