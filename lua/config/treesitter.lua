local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "blade",
}

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
	},
}
