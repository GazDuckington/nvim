local name = function(str)
	local pattern = "^[^-]+-(.+)$"
	return string.match(str, pattern)
end

local scheme = name(vim.g.colors_name)
if scheme == nil then
	scheme = "mocha"
end
local color = require("catppuccin.palettes").get_palette(scheme)

-- colorscheme
require("catppuccin").setup({
	flavour = scheme,
	transparent_background = true,
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
		gitsigns = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
	},
	custom_highlights = {
		CursorLine = { bg = color.crust },
		LineNr = { fg = color.surface2 },
		CursorLineNr = {
			fg = color.green,
			bg = color.mantle,
			bold = true,
		},
		IndentBlanklineContextChar = {
			fg = color.mauve,
			nocombine = true,
		},
		IndentBlanklineSpaceChar = {
			fg = color.surface0,
		},
	},
})

vim.cmd.colorscheme("catppuccin")
