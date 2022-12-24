require('nvim-tree').setup({
	view = {
		side = 'right',
		adaptive_size = false,
		number = true,
		relativenumber = true,
		float = {
			enable = true,
			open_win_config = {
				width = 45,
				height = 45,
			}
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "﫧",
					ignored = "◌",
				},
			},
		},
	},
})
