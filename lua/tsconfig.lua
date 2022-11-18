-- treesitter
require 'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	context_commentstring = {
		enable = true
	},
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	autotag = {
		enable = true,
		-- filetypes = vim.g.web_filetypes
	}
}
