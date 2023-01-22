local function open_tab_silent(node)
	local api = require("nvim-tree.api")
	api.node.open.tab(node)
	vim.cmd.tabprev()
end

require('nvim-tree').setup({
	view = {
		side = 'right',
		adaptive_size = false,
		number = true,
		relativenumber = true,
		float = {
			enable = true,
			open_win_config = {
				width = 40,
				height = 30,
			}
		},
		mappings = {
			list = {
				{
					key = "t",
					action = "open_tab_silent",
					action_cb = open_tab_silent
				},
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
