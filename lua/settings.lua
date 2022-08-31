-- global settings
vim.opt_global.shell='fish'

-- appearance
vim.cmd([[highlight WinSeparator guibg=none]])
vim.cmd([[au ColorScheme * hi Normal ctermbg=none guibg=none]])
vim.o.laststatus = 3
vim.o.termguicolors = true

-- mouse
vim.cmd [[set mouse=a]]
vim.opt.hidden = true

-- indentation
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.smartindent = true
vim.opt.number = true
