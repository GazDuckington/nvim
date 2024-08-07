local ufo = require("ufo")

vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { 'treesitter', 'indent' }
	end
})
