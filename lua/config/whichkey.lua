local whichkey = require("which-key")
-- local possession = require("nvim-possession")

local mappings = {
	{ "<leader>.",  ":cd ~/.config/nvim<cr>:e init.lua<cr>",                  desc = "Open Neovim Config" },
	{ "<leader>n",  ":nohl<cr>",                                              desc = "Reset highlight" },
	{ "<leader>r",  "<cmd>Greyjoy<cr>",                                       desc = "Greyjoy launcher" },
	{ "<leader>i",  "<cmd>cd %:p:h<cr>",                                      desc = "Cd to Buffer" },
	{ "<leader>o",  ":e ",                                                    desc = "Open/Create File" },
	{ "<leader>c",  ":ColorizerToggle<cr>",                                   desc = "Toggle colorizer" },
	-- { "<leader>C",  ":Telescope conventional_commits<cr>",                    desc = "conventional commit" },

	-- file manager
	{ "<leader>e",  "<cmd>NvimTreeToggle<cr>",                                desc = "Open file manager" },
	-- { "<leader>ec", "<cmd>Yazi cwd<cr>",                                      desc = "Open yazi file manager in current directory" },

	{ "<leader>m",  group = "Menu" },
	{ "<leader>mg", "<cmd>lua Snacks.lazygit()<cr>",                          desc = "LazyGit" },
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
	{ "<leader>l",  group = "Telescope LSP" },
	{ "<leader>f",  group = "Telescope Fuzzy Finder" },
	{ "<leader>b",  group = "Buffer Sorting" },

	{ "<leader>z",  group = "Snacks Mode" },
	{ "<leader>zz", function() Snacks.toggle.zen():toggle() end,  desc = "Zen Mode" },
	{ "<leader>zd", function() Snacks.toggle.dim():toggle() end,  desc = "Dim Mode" },
	{ "<leader>zf", function() Snacks.toggle.zoom():toggle() end, desc = "Zoom Mode" },


	-- telescope stuff
	{ "<leader>f",  group = "Telescope Find" },
	{ "<leader>fg", "<cmd>Telescope git_files<cr>",               desc = "Telescope Find Git Files" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>",              desc = "Telescope Find Files" },
	{ "<leader>fr", "<cmd>Telescope live_grep<cr>",               desc = "Telescope Grep String" },
	{ "<leader>fs", "<cmd>Telescope grep_string<cr>",             desc = "Telescope Find String" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>",                 desc = "Telescope Find Buffers" },
	{ "<leader>fu", "<cmd>Telescope undo<cr>",                    desc = "Telescope Undo" },
	{ "<leader>ft", "<cmd>TodoTelescope<cr>",                     desc = "Telescope Find TODO" },
}

for n = 1, 9 do
	local key = string.format("<leader>%d", n)
	local term = string.format("%d:lua Snacks.terminal.toggle()<CR>", n)
	whichkey.add({ key, term, hidden = true })
end

whichkey.add(mappings)
whichkey.setup({})
