require('lspconfig').sourcery.setup({
	init_options = {
		token = os.getenv('SOURCERY_TOKEN')
	}
})

require('lspconfig').emmet_ls.setup({
	filetypes = vim.g.web_filetypes
})
