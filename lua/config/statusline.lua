local function session_name()
	return require('possession.session').session_name or ''
end

local line = { function()
	return " "
end,
	padding = 0,
}

require('lualine').setup({
	sections = {
		lualine_a = {
			line
		},
		lualine_b = {
			{ 'mode',
				fmt = function(res)
					return res:sub(1, 3)
				end,
			}
		},
		lualine_c = {
			'branch', 'diff',
			{
				'filename',
				file_status = true,
				newfile_status = true,
				path = 1,
				fmt = function(res)
					return ' ' .. res
				end
			},
		},
		lualine_x = {
			'diagnostics', 'filetype', 'location'
		},
		lualine_y = { { session_name }, 'progress' },
		lualine_z = { line },
	},
	options = {
		theme = 'catppuccin',
		global_status = true,
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
})
