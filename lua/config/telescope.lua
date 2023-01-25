local telescope = require("telescope")
local actions = require("telescope.actions")
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
				prompt_position = "top",
			}
		},
		borderchars = {
			-- { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<A-j>"] = actions.move_selection_next,
				["<A-k>"] = actions.move_selection_previous,
				["<A-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
			n = {
				["<A-n>"] = actions.move_selection_next,
				["<A-p>"] = actions.move_selection_previous,
				["<A-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			}
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			hidden = true,
			previewer = false,
		},
		live_grep = {
			only_sort_text = true,
			theme = "dropdown",
		},
		grep_string = {
			only_sort_text = true,
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
			initial_mode = "normal",
			mappings = {
				i = {
					["<A-d>"] = actions.delete_buffer,
				},
				n = {
					["dd"] = actions.delete_buffer,
				},
			},
		},
	},
}

-- keybindings
map("n", "<leader>sg", "<cmd>Telescope git_files<cr>", opts)
map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>sr", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>ss", "<cmd>Telescope grep_string<cr>", opts)
map("n", "<leader>sb", "<cmd>Telescope buffers<cr>", opts)
