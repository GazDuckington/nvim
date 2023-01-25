local colors = require("catppuccin.palettes").get_palette "mocha"

local catto = {
	normal = {
		a = { fg = colors.base, bg = colors.blue },
		b = { fg = colors.text, bg = colors.surface0, gui = 'bold' },
		c = { fg = colors.blue, bg = colors.mantle },
	},

	insert = { a = { fg = colors.base, bg = colors.green } },
	visual = { a = { fg = colors.base, bg = colors.peach } },
	replace = { a = { fg = colors.base, bg = colors.mauve } },
	command = { a = { fg = colors.base, bg = colors.red } },

	inactive = {
		a = { fg = colors.text, bg = colors.mantle },
		b = { fg = colors.text, bg = colors.mantle },
		c = { fg = colors.surface2, bg = colors.mantle },
	},
}

local line = { function()
	return " "
end,
	padding = 0,
}

local md = { 'mode',
	fmt = function(res)
		return res:sub(1, 1)
	end,
	color = { gui = 'bold' },
}

require('lualine').setup({
	sections = {
		lualine_a = {
			md
		},
		lualine_b = {},
		lualine_c = {
			'branch',
			{
				'buffers',
				show_filename_only = true,
				symbols = {
					modified = ' ●',
					alternate_file = '',
					directory = '',
				},
			},
		},
		lualine_x = {
			'diff', 'diagnostics', 'filetype', 'progress'
		},
		lualine_y = {},
		lualine_z = { line },
	},
	options = {
		theme = catto,
		globalstatus = true,
		component_separators = '',
		-- section_separators = { left = '🭐', right = '🭅' },
		section_separators = { left = '', right = '' },
	},
})
