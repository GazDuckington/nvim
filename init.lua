-- GazDuckington

-- user settings
require('settings')
require('keybinding')
require('autos')
require('plugins')
require('tsconfig')
require('colorscheme')
require('statusline')
require('lsconfig')
require('autocmp')
require('term')
require('teleconfig')

-- plugin settings
require('impatient')
require('nvim-ts-autotag').setup()
require('nvim-autopairs').setup()
require('nvim_comment').setup()
require('go').setup()

-- better comments
require('better-comment').Setup({
	tags = {
		{
			name = "!",
			fg = "",
			bg = "",
			bold = true,
			virtual_text = "",
		},
		{
			name = "!!",
			fg = "#f44747",
			bg = "",
			bold = true,
			virtual_text = "",
		}
	}
})

-- barbar line
require('bufferline').setup({
	clickable = true
})

-- glow preview
require('glow').setup({
	style = "dark",
})

-- lsp lang servers.
-- lsconfig only contain the automated setups
require('lspconfig').sourcery.setup({
	init_options = {
		token = os.getenv("sourcery_token")
	}
})

require 'lspconfig'.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
}

require("lspconfig").emmet_ls.setup({
	filetypes = {
		'html',
		'typescriptreact',
		'javascriptreact',
		'css',
		'sass',
		'scss',
		'less',
		'svelte',
		'markdown'
	},
})
