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
require('whichkey')
require('gjoy')

-- plugin settings
require('impatient')
require("toggleterm").setup()
require('nvim-ts-autotag').setup()
require('nvim-autopairs').setup()
require('nvim_comment').setup()
require('better-comment').Setup()
require('dressing').setup()
require('leap').add_default_mappings()
require('nvim-tree').setup()
require("colorizer").setup()

-- GENERAL PLUGIN SETTINGS
-- problems
require("trouble").setup {
	use_diagnostic_signs = false
}

-- barbar line
require('bufferline').setup({
	clickable = true
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
