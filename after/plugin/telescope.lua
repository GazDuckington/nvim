local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "❯ ",
		sorting_strategy = "ascending",
		layout_strategy = "center",
		layout_config = {
			center = {
				width = 0.7,
			}
		},
		borderchars = {
			{ '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
			preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		},
	},
})
