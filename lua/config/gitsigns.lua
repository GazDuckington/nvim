local map = vim.keymap.set
local opts = vim.g.opts

require('gitsigns').setup {
	current_line_blame = false,
	current_line_blame_opts = {
		delay = 0,
	},
}

map('n', ']c', ':Gitsigns next_hunk<cr>', opts)
map('n', '[c', ':Gitsigns prev_hunk<cr>', opts)
map({ 'n', 'v' }, '<leader>ns', ':Gitsigns stage_hunk<CR>', opts)
map({ 'n', 'v' }, '<leader>nr', ':Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>nS', ':Gitsigns stage_buffer<CR>', opts)
map('n', '<leader>nu', ':Gitsigns undo_stage_hunk<CR>', opts)
map('n', '<leader>nR', ':Gitsigns reset_buffer<CR>', opts)
map('n', '<leader>np', ':Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>nb', ':Gitsigns blame_line full=true<CR>', opts)
map('n', '<leader>nB', ':Gitsigns toggle_current_line_blame<CR>', opts)
map('n', '<leader>nd', ':Gitsigns diffthis<CR>', opts)
map('n', '<leader>nD', ':Gitsigns diffthis ~<CR>', opts)
map('n', '<leader>nt', ':Gitsigns toggle_deleted<CR>', opts)
map({ 'o', 'x' }, 'ni', ':<C-U>Gitsigns select_hunk<CR>', opts)
