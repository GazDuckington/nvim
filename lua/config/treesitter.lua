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
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
		filetypes = vim.g.web_filetypes
	}
}
