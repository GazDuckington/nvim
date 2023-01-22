local telescope = require("telescope")
local opts = vim.g.opts
local map = vim.keymap.set

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

map("n", "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fr", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers initial_mode=normal<cr>", opts)
