require('lualine').setup({
	sections = {
		lualine_a = {
			{ 'mode',
				fmt = function(res)
					return res:sub(1, 1)
				end,
			}
		},
		lualine_b = { 'branch' },
		lualine_c = {
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
			'diagnostics', 'diff',
			{
				'filesize',
				padding = { left = 0, right = 1 }
			}, 'filetype',
		},
		lualine_y = { 'location' },
		lualine_z = {},
	},
	options = {
		theme = 'catppuccin',
		global_status = true,
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
})
