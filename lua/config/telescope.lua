local telescope = require("telescope")
local actions = require("telescope.actions")

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
			hidden = true,
			-- theme = "dropdown",
			-- previewer = false,
		},
		live_grep = {
			only_sort_text = true,
			-- theme = "dropdown",
			-- previewer = false,
		},
		grep_string = {
			only_sort_text = true,
			-- theme = "dropdown",
			-- previewer = false,
		},
		buffers = {
			-- theme = "dropdown",
			-- previewer = false,
			-- initial_mode = "normal",
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

-- extensions
telescope.load_extension("fzf")
telescope.load_extension("conventional_commits")
telescope.load_extension('lsp_handlers')
