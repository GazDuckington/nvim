-- global settings
vim.opt_global.shell = 'fish'
vim.g.must_lsp = {
	'sumneko_lua',
	'pyright',
	'gopls',
	'svelte',
	'tsserver',
	'tailwindcss',
	'emmet_ls',
	'marksman',
	'texlab',
}

-- appearance
vim.cmd([[highlight WinSeparator guibg=none]])
vim.o.cursorline = true
vim.o.laststatus = 3
vim.opt.relativenumber = true

-- mouse
vim.cmd [[set mouse+=a]]
vim.opt.hidden = true

-- indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
