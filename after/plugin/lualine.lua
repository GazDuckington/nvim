local colors = {
	black = '#181825',
	grey  = '#313244',
	white = '#CDD6F4',
	blue  = '#89B4FA',
	cyan  = '#89DCEB',
	green = '#A6E3A1',
	peach = '#FAB387',
	red   = '#F38BA8',
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
		c = { fg = colors.grey, bg = colors.black },
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
		globalstatus = true,
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
})
