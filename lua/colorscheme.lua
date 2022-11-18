-- colorscheme
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
	transparent_background = false,
	term_colors = true,
	integrations = {
		ts_rainbow = true,
		nvimtree = true,
		barbar = true,
		which_key = true,
		lsp_trouble = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
	},
	custom_highlights = {
		Comment = { fg = '#7e8991' },
		LineNr = { fg = '#7e8991' },
		CursorLine = { bg = '#181825' },
		CursorLineNr = {
			fg = '#04b956',
			bg = '#181825'
		},
	},
})
vim.cmd [[colorscheme catppuccin]]
