-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
-- https://gtihub.com/GazDuckington/nvim

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

-- init plugins
require('impatient')
require("toggleterm").setup()
require('nvim-autopairs').setup()
require('nvim_comment').setup()
require('dressing').setup()
require('leap').add_default_mappings()
require('nvim-tree').setup()
require("colorizer").setup()

-- GENERAL PLUGIN SETTINGS
require("zen-mode").setup({
	window = {
		width = .85,
		height = .95
	},
	-- on_open = function()
	-- 	vim.cmd([[set spell]])
	-- 	vim.cmd([[set linebreak]])
	-- end,
	-- on_close = function()
	-- 	vim.cmd([[set nospell]])
	-- 	vim.cmd([[set nolinebreak]])
	-- end
})
-- problems
-- require("trouble").setup {
-- 	use_diagnostic_signs = false
-- }

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
	filetypes = vim.g.web_filetypes
})

-- rainbow tabline
require("indent_blankline").setup({
	-- char_highlight_list = {
	-- 	"IndentBlanklineIndent1",
	-- 	"IndentBlanklineIndent2",
	-- 	"IndentBlanklineIndent3",
	-- 	"IndentBlanklineIndent4",
	-- 	"IndentBlanklineIndent5",
	-- 	"IndentBlanklineIndent6",
	-- },
	show_current_context = true,
})

require("nvim-tree").setup({
	view = {
		side = 'right',
		adaptive_size = true,
		float = {
			enable = false,
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "﫧",
					ignored = "◌",
				},
			},
		},
	},
})
