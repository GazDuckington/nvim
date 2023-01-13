local telescope = require("telescope")

telescope.setup({
	defaults = {
		initial_mode = "normal",
		prompt_prefix = "  ",
		selection_caret = "→ ",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				width = 0.8,
				prompt_position = "top",
			}
		},
		borderchars = {
			{ '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			prompt = { "─", "│", "─", "│", '┌', '┐', "┘", "└" },
			results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		},
	},
})
