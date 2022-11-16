require('lualine').setup({
	sections = {
		-- lualine_a = { 'mode' },
		lualine_a = { { 'mode', fmt = function(res) return res:sub(1, 3) end } },
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
		-- section_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
	},
})
