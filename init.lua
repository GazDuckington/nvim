-- GazDuckington

-- imports
require('keybinding')
require('autos')

-- colors
vim.cmd([[au ColorScheme * hi WinSeparator guibg=none]])
vim.cmd([[au ColorScheme * hi Normal ctermbg=none guibg=none]])
vim.o.termguicolors = false

-- mouse
vim.cmd [[set mouse=a]]
vim.opt.hidden = true

-- indentation
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.smartindent = true
vim.opt.number = true

