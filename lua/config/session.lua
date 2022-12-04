require('possession').setup {
	commands = {
		save = 'SSave',
		load = 'SLoad',
		delete = 'SDelete',
		list = 'SList',
	},
	autosave = {
		current = true,
		tmp = true,
		tmp_name = function()
			return vim.api.nvim_buf_get_name(0)
		end,
		on_quit = true
	}
}
