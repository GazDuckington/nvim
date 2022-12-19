local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "❯ ",
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			vertical = {
				prompt_position = "top",
				-- width = 0.5,
				height = 0.5,
			}
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--hidden", "--glob", "" },
			theme = "dropdown",
			previewer = false,
		},
		git_files = {
			theme = "dropdown",
			previewer = false,
		},
		live_grep = {},
		lsp_references = { theme = "cursor" },
		buffers = {
			theme = "dropdown",
			previewer = false,
		}
	}
})

telescope.load_extension('possession')
