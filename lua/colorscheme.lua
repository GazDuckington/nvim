-- colorscheme
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
	transparent_background = false,
	-- term_colors = true,
	ts_rainbow = true,
	barbar = true,
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
