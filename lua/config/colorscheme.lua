local color = require("catppuccin.palettes").get_palette "mocha"

-- colorscheme
require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = false,
	term_colors = true,
	integrations = {
		mason = true,
		leap = true,
		treesitter = true,
		ts_rainbow = true,
		nvimtree = true,
		telescope = true,
		barbar = true,
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
	},
	custom_highlights = {
		Comment = { fg = color.overlay0 },
		LineNr = { fg = color.surface2 },
		CursorLine = { bg = color.mantle },
		CursorLineNr = {
			fg = color.green,
			bg = color.mantle,
			bold = true
		},
		IndentBlanklineContextChar = {
			fg = color.mauve,
			nocombine = true,
		},
	},
})
vim.cmd [[colorscheme catppuccin]]