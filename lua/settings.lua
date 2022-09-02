-- global settings
vim.opt_global.shell = 'fish'
vim.g.must_lsp = { 'sumneko_lua', 'pyright', 'gopls', 'svelte', 'tsserver', 'tailwindcss', 'emmet_ls' }
vim.g.termguicolors = true

-- appearance
vim.cmd([[highlight WinSeparator guibg=none]])
-- vim.cmd([[au ColorScheme * hi Normal ctermbg=none guibg=none]])
vim.o.laststatus = 3
vim.o.termguicolors = true
vim.opt.number = true

-- mouse
vim.cmd [[set mouse+=a]]
vim.opt.hidden = true

-- indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
