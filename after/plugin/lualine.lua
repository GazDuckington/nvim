local colors = {
	blue  = '#80A0FF',
	cyan  = '#79DAC8',
	black = '#181825',
	white = '#CDD6F4',
	red   = '#F38BA8',
	peach = '#FAB387',
	grey  = '#313244',
	green = '#A6E3A1',
}

local catto = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white, bg = colors.black },
	},

	insert = { a = { fg = colors.black, bg = colors.green } },
	visual = { a = { fg = colors.black, bg = colors.peach } },
	replace = { a = { fg = colors.black, bg = colors.red } },
	command = { a = { fg = colors.black, bg = colors.cyan } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

local line = { function()
	return " "
end,
	padding = 0,
}

local md = { 'mode',
	fmt = function(res)
		return res:sub(1, 3)
	end,
	color = { gui = 'bold' }
}

local fn = {
	'filename',
	file_status = true,
	newfile_status = true,
	path = 1,
	fmt = function(res)
		return ' ' .. res
	end,
}

require('lualine').setup({
	sections = {
		lualine_a = {
			md
		},
		lualine_b = { 'branch' },
		lualine_c = {
			fn,
		},
		lualine_x = {
			'diff', 'diagnostics', 'filetype', 'progress'
		},
		lualine_y = { 'location' },
		lualine_z = { line },
	},
	options = {
		theme = catto,
		global_status = true,
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
})
