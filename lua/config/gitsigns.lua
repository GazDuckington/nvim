local map = vim.keymap.set
local opts = vim.g.opts

require('gitsigns').setup {
	current_line_blame = false,
	current_line_blame_opts = {
		delay = 0,
	},
}

map("n", "]c", ":Gitsigns next_hunk<cr>", opts)
map("n", "[c", ":Gitsigns prev_hunk<cr>", opts)
