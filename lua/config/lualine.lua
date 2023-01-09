local colors = require("catppuccin.palettes").get_palette "mocha"

local catto = {
	normal = {
		a = { fg = colors.base, bg = colors.blue },
		b = { fg = colors.text, bg = colors.surface0, gui = 'bold' },
		c = { fg = colors.blue, bg = colors.base },
	},

	insert = { a = { fg = colors.base, bg = colors.green } },
	visual = { a = { fg = colors.base, bg = colors.peach } },
	replace = { a = { fg = colors.base, bg = colors.mauve } },
	command = { a = { fg = colors.base, bg = colors.red } },

	inactive = {
		a = { fg = colors.text, bg = colors.base },
		b = { fg = colors.text, bg = colors.base },
		c = { fg = colors.overlay0, bg = colors.base },
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
	color = { gui = 'bold' }
}

require('lualine').setup({
	sections = {
		lualine_a = {
			md
		},
		lualine_b = { 'branch' },
		lualine_c = {
			{
				'buffers',
				show_filename_only = false,
				symbols = {
					modified = ' ●',
					alternate_file = '',
					directory = '',
				},
			},
		},
		lualine_x = {
			'diff', 'diagnostics'
		},
		lualine_y = { 'progress' },
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