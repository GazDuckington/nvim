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
map({ "n", "v" }, "<leader>ts", ":Gitsigns stage_hunk<CR>", opts)
map({ "n", "v" }, "<leader>tr", ":Gitsigns reset_hunk<CR>", opts)
map("n", "<leader>tS", ":Gitsigns stage_buffer<CR>", opts)
map("n", "<leader>tu", ":Gitsigns undo_stage_hunk<CR>", opts)
map("n", "<leader>tR", ":Gitsigns reset_buffer<CR>", opts)
map("n", "<leader>tp", ":Gitsigns preview_hunk<CR>", opts)
map("n", "<leader>tb", ":Gitsigns blame_line full=true<CR>", opts)
map("n", "<leader>tB", ":Gitsigns toggle_current_line_blame<CR>", opts)
map("n", "<leader>td", ":Gitsigns diffthis<CR>", opts)
map("n", "<leader>tD", ":Gitsigns diffthis ~<CR>", opts)
map("n", "<leader>tt", ":Gitsigns toggle_deleted<CR>", opts)
map({ "o", "x" }, "<leader>ti", ":<C-U>Gitsigns select_hunk<CR>", opts)
