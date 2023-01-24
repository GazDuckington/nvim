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
map({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', opts)
map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>gS', ':Gitsigns stage_buffer<CR>', opts)
map('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', opts)
map('n', '<leader>gR', ':Gitsigns reset_buffer<CR>', opts)
map('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>gb', ':Gitsigns blame_line full=true<CR>', opts)
map('n', '<leader>gB', ':Gitsigns toggle_current_line_blame<CR>', opts)
map('n', '<leader>gd', ':Gitsigns diffthis<CR>', opts)
map('n', '<leader>gD', ':Gitsigns diffthis ~<CR>', opts)
map('n', '<leader>gt', ':Gitsigns toggle_deleted<CR>', opts)
map({ 'o', 'x' }, 'gi', ':<C-U>Gitsigns select_hunk<CR>', opts)
