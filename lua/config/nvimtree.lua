require('nvim-tree').setup({
	view = {
		side = 'right',
		adaptive_size = false,
		float = {
			enable = false,
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
