-- set leader key
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local ops = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = false, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
	["/"] = { "<cmd>CommentToggle<cr>", "Comment Line (C-/)" },
	["."] = { ":cd ~/.config/nvim<cr>:e init.lua<cr>", "Open Neovim Config" },
	i = { ":cd %:p:h<cr>", "Cd to Buffer" },
	e = { ":NvimTreeToggle<cr>", "Open tree view" },
	g = { ":lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
	r = { "<cmd>Greyjoy<cr>", "Greyjoy launcher" },
	z = { "<cmd>ZenMode<cr>", "Keybind Zen mode" },
	m = { "<cmd>TroubleToggle quickfix<cr>", "Toggle QuickFix" },
	f = {
		name = "Files",
		o = { ":e ", "Open/Create File" },
		s = { ":w!<cr>", "Save (C-s)" },
		S = { ":saveas ", "Save buffer as (C-S-s)" },
		q = { ":q!<cr>", "Quit (C-q)" },
	},
	v = {
		name = "Views",
		s = { ":new<cr>", "Split New Horizontal" },
		v = { ":vnew<cr>", "Split New Vertical" },
		S = { ":split<cr>", "Split Editor Horizontal" },
		V = { ":vsplit<cr>", "Split Editor Vertical" },
	},
	b = {
		name = "Buffers",
		j = { ":BufferPrevious<cr>", "Previous Buffer (C-,)" },
		k = { ":BufferNext<cr>", "Next Buffer (C-.)" },
		J = { ":BufferMovePrevious<cr>", "Move Buffer to Previous (C-j)" },
		K = { ":BufferMoveNext<cr>", "Move Buffer to Next (C-k)" },
		q = { ":bdelete<cr>", "Close Buffer" }
	},
	t = {
		name = "Telescope",
		p = { "<cmd>Telescope find_files<cr>", "Find Files (C-p)" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep strings live in cwd (C-g)" },
		s = { "<cmd>Telescope grep_string<cr>", "Grep strings under cursor" },
		b = { "<cmd>Telescope buffers<cr>", "List Buffers (C-b)" },
		h = { "<cmd>Telescope help_tags<cr>", "Help (C-S-h)" },
		k = { "<cmd>Telescope keymaps<cr>", "List all keymaps" },
	},
}

local wk = require("which-key")
wk.register(mappings, ops)

-- QoL
map("n", "P", '"0p', opts)
map("i", "jk", "<ESC>", opts)

-- save & quit
map("i", "<c-s>", "<ESC>:w!<cr>", opts)
map("n", "<c-s>", "<ESC>:w!<cr>", opts)
map("n", "<c-q>", ":q!<cr>", opts)

-- move line up & down
map("n", "<A-k>", "<Esc><cmd>m .-2<cr>==", opts)
map("n", "<A-j>", "<Esc><cmd>m .+1<cr>==", opts)
map("v", "<A-k>", "<Esc><cmd>m '<-2<cr>gv=gv", opts)
map("v", "<A-j>", "<Esc><cmd>m '>+1<cr>gv=gv", opts)
map("i", "<c-o>", "<C-O>o", opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- close buffer
map("n", "<C-S-w>", ":bdelete!<cr>", opts)

-- Move to previous/next
map("n", "<C-,>", "<Cmd>BufferPrevious<cr>", opts)
map("n", "<C-.>", "<Cmd>BufferNext<cr>", opts)

-- comment line
map("n", "<C-/>", ":CommentToggle<cr>", opts)
map("v", "<C-/>", ":'<,'>CommentToggle<cr>", opts)

-- telescope
map("n", "<C-p>", "<cmd>Telescope find_files preview_cutoff=1<cr>", opts)
map("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
map("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<C-b>", "<cmd>Telescope buffers<cr>", opts)
map("n", "<C-S-h>", "<cmd>Telescope help_tags<cr>", opts)
map("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>", opts)
map("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- terminal
for var = 1, 9 do
	local key = string.format("<C-%s>", var)
	local term = string.format("<cmd>%sToggleTerm<cr>", var)
	map("n", key, term, opts)
end
