require('lualine').setup({
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = {
			{
				'filename',
				file_status = true,
				newfile_status = true,
				path = 3,
			}
		},
		lualine_x = { 'diagnostics', 'diff' },
		lualine_y = { 'filetype' },
		lualine_z = { 'location', 'progress' },
	},
	options = {
		theme = "catppuccin",
		global_status = true,
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
})
