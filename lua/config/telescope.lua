local telescope = require("telescope")

telescope.setup {
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "→ ",
		results_title = "",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				width = 0.7,
				height = 0.5,
				prompt_position = "top",
			}
		},
		previewer = false,
		borderchars = {
			{ '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			prompt = { "─", "│", "─", "│", '┌', '┐', "┘", "└" },
			results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		},
	},
}

telescope.load_extension("ui-select")
