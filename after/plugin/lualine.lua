local function session_name()
	return require('possession.session').session_name or ''
end

local line = { function()
	return " "
end,
	padding = 0,
}

local md = { 'mode',
	fmt = function(res)
		return res:sub(1, 3)
	end,
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
		lualine_b = {},
		lualine_c = {
			fn,
		},
		lualine_x = {
			'diff', 'branch', 'diagnostics', 'filetype', 'location', session_name
		},
		lualine_y = {},
		lualine_z = { line },
	},
	options = {
		theme = 'catppuccin',
		global_status = true,
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
})
