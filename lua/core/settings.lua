local o = vim.opt
local g = vim.g
local wo = vim.wo
local cmd = vim.cmd

vim.opt_global.shell = "fish"

if vim.g.colors_name == nil then
	vim.g.colors_name = "cattpuccin-mocha"
end

-- must install lsp servers
g.must_lsp = {
	"lua_ls",
	"pyright",
	"gopls",
	"svelte",
	"eslint",
	"tailwindcss",
	"emmet_ls",
	"marksman",
	"sourcery",
	"cssls",
}
-- filetypes for emmet
g.web_filetypes = {
	"html",
	"templ",
	"typescriptreact",
	"javascriptreact",
	"css",
	"sass",
	"scss",
	"less",
	"eruby",
	"svelte",
	"markdown",
	"markdown.mdx",
	"htmldjango",
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
g.maplocalleader = " "
g.breadcrumb_enabled = true
g.loaded_netrw = 0
g.loaded_netrwPlugin = 0
-- end of global settings

-- appearance
o.termguicolors = true
o.cursorline = true
-- overirden by lualine
o.laststatus = 2
o.number = true
o.relativenumber = true

o.path = { "." }
o.signcolumn = "yes"
cmd.set("clipboard+=unnamedplus")
o.updatetime = 250
o.scrolloff = 8

-- whitespace character
o.list = true
o.listchars = {
	tab = '  ',
	-- trail = '◦',
	-- space = '•',
	eol = '',
}

-- mouse
o.mouse = "a"
o.hidden = true

-- search
o.hlsearch = true
o.incsearch = true

-- indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true

-- undo
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- text wrapping
wo.wrap = false
wo.list = false
wo.linebreak = true

-- disable diagnostics inline texts
vim.diagnostic.config({
	virtual_text = true,
	float = {
		source = true,
		border = 'rounded',
	}
})

-- Concatenate two tables
function TableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end
