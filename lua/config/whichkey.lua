local whichkey = require("which-key")
local possession = require("nvim-possession")

local mappings = {
	{ "<leader>.",  ":cd ~/.config/nvim<cr>:e init.lua<cr>",                  desc = "Open Neovim Config" },
	{ "<leader>e",  "<cmd>NvimTreeFindFileToggle<cr>",                        desc = "Open tree view" },
	{ "<leader>n",  ":nohl<cr>",                                              desc = "Reset highlight" },
	{ "<leader>r",  "<cmd>Greyjoy<cr>",                                       desc = "Greyjoy launcher" },
	{ "<leader>i",  "<cmd>cd %:p:h<cr>",                                      desc = "Cd to Buffer" },
	{ "<leader>o",  ":e ",                                                    desc = "Open/Create File" },
	{ "<leader>c",  ":ColorizerToggle<cr>",                                   desc = "Toggle colorizer" },
	{ "<leader>C",  ":Telescope conventional_commits<cr>",                    desc = "conventional commit" },

	{ "<leader>m",  group = "Menu" },
	{ "<leader>mg", "<cmd>LazyGit<cr>",                                       desc = "LazyGit" },
	{ "<leader>ml", "<cmd>Lazy<cr>",                                          desc = "Open Lazy.nvim menu" },
	{ "<leader>mm", "<cmd>Mason<cr>",                                         desc = "Open Mason menu" },
	{ "<leader>ms", ":saveas ",                                               desc = "Save buffer as" },
	{ "<leader>mi", ":LspInfo<cr>",                                           desc = "LSP Info" },
	{ "<leader>mn", ":Navbuddy<cr>",                                          desc = "Navbuddy, explore breadcrumb" },
	{ "<leader>mf", ":FocusToggle<cr>",                                       desc = "FocusToggle" },

	{ "<leader>h",  group = "Helps" },
	{ "<leader>hk", "<cmd>Telescope keymaps<cr>",                             desc = "L:vnoremap < <gvist all keymaps" },
	{ "<leader>hh", "<cmd>Telescope help_tags<cr>",                           desc = "Help Tags" },

	{ "<leader>v",  group = "Views" },
	{ "<leader>vl", "<cmd>vsplit<cr><C-w>l",                                  desc = "Focus split right" },
	{ "<leader>vj", "<cmd>split<cr><C-w>j",                                   desc = "Focus split down" },

	{ "<leader>q",  group = "Quickfix" },
	{ "<leader>qN", ":cprevious<cr>",                                         desc = "Previous" },
	{ "<leader>qo", ":copen<cr>",                                             desc = "Open" },
	{ "<leader>qn", ":cnext<cr>",                                             desc = "Next" },

	{ "<leader>g",  group = "Harpoon" },
	{ "<leader>gu", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Marks" },
	{ "<leader>gh", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Mark file" },
	{ "<leader>gk", "<cmd>lua require('harpoon.ui').nav_next()<cr>",          desc = "Next marks" },
	{ "<leader>gj", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",          desc = "Prev marks" },

	{ "<leader>S",  group = "Sessions" },
	{ "<leader>Sl", function() possession.list() end,                         desc = "sessions list" },
	{ "<leader>Sn", function() possession.new() end,                          desc = "create new session" },
	{ "<leader>Su", function() possession.update() end,                       desc = "update session" },
	{ "<leader>Sd", function() possession.delete() end,                       desc = "delete session" },

	{ "<leader>x",  group = "Trouble" },
	{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>",           desc = "Worksapce Diagnostics" },
	{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",            desc = "Document Diagnostics" },
	{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",                        desc = "QuickFix" },


	{ "<leader>t",  group = "Git Signs" },
	{
		"<leader>ts", ":Gitsigns stage_hunk<CR>", mode = { "n", "v" },
	},
	{
		"<leader>tr", ":Gitsigns reset_hunk<CR>", mode = { "n", "v" },
	},
	{
		"<leader>tS", ":Gitsigns stage_buffer<CR>", mode = "n",
	},
	{
		"<leader>tu", ":Gitsigns undo_stage_hunk<CR>", mode = "n",
	},
	{
		"<leader>tR", ":Gitsigns reset_buffer<CR>", mode = "n",
	},
	{
		"<leader>tp", ":Gitsigns preview_hunk<CR>", mode = "n",
	},
	{
		"<leader>tb", ":Gitsigns blame_line full=true<CR>", mode = "n",
	},
	{
		"<leader>tB", ":Gitsigns toggle_current_line_blame<CR>", mode = "n",
	},
	{
		"<leader>td", ":Gitsigns diffthis<CR>", mode = "n",
	},
	{
		"<leader>tD", ":Gitsigns diffthis ~<CR>", mode = "n",
	},
	{
		"<leader>tt", ":Gitsigns toggle_deleted<CR>", mode = "n",
	},
	{
		"<leader>ti", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" },
	},
}

for var = 1, 9 do
	local key = string.format("<leader>%s", var)
	local term = string.format("<cmd>%sToggleTerm<cr>", var)
	whichkey.add({ key, term, hidden = true })
end

whichkey.add(mappings)


whichkey.setup({})
