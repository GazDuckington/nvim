require('gitsigns').setup {
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 0,
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
			if vim.wo.diff then return ']c' end
			vim.schedule(function() gs.next_hunk() end)
			return '<Ignore>'
		end, { expr = true })

		map('n', '[c', function()
			if vim.wo.diff then return '[c' end
			vim.schedule(function() gs.prev_hunk() end)
			return '<Ignore>'
		end, { expr = true })

		-- Actions
		map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
		map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
		map('n', '<leader>hS', ':Gitsigns stage_buffer<CR>')
		map('n', '<leader>hu', ':Girsigns undo_stage_hunk<CR>')
		map('n', '<leader>hR', ':Girsigns reset_buffer<CR>')
		map('n', '<leader>hp', ':Girsigns preview_hunk<CR>')
		map('n', '<leader>hb', function() gs.blame_line { full = true } end)
		map('n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>')
		map('n', '<leader>hd', ':Gitsigns diffthis<CR>')
		map('n', '<leader>hD', function() gs.diffthis('~') end)
		map('n', '<leader>td', ':Gitsigns toggle_deleted<CR>')
		map('n', '<leader>hB', ':Gitsigns toggle_current_line_blame')

		-- Text object
		map({ 'o', 'x' }, 'hi', ':<C-U>Gitsigns select_hunk<CR>')
	end
}
