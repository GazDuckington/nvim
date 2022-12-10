-- set leader key
vim.g.mapleader = " "

local wk = require("which-key")
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local mappings = {
	["/"] = { "<cmd>CommentToggle<cr>", "Comment Line (C-/)" },
	["."] = { ":cd ~/.config/nvim<cr>:e init.lua<cr>", "Open Neovim Config" },
	i = { "<cmd>cd %:p:h<cr>", "Cd to Buffer" },
	e = { "<cmd>NvimTreeFindFileToggle<cr>", "Open tree view" },
	l = { "<cmd>Greyjoy<cr>", "Greyjoy launcher" },
	z = { "<cmd>ZenMode<cr>", "Keybind Zen mode" },
	r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP variable renamer" },
	g = {
		name = "Goto",
		d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
		r = { "<cmd>Telescope lsp_references<cr>", "References" },
		t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definitions" },
	},
	m = {
		name = "Problems",
		m = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		n = { "<cmd>Telescope quickfix<cr>", "Quickfixes (if available)" },
	},
	f = {
		name = "Files",
		f = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Find symbols" },
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
		o = { ":e ", "Open/Create File" },
		s = { "<cmd>w!<cr>", "Save (C-s)" },
		S = { ":saveas ", "Save buffer as (C-S-s)" },
		q = { "<cmd>q!<cr>", "Quit (C-q)" },
		b = { "<cmd>Barbecue toggle<cr>", "Toggle breadcrumb" },
	},
	v = {
		name = "Views",
		s = { "<cmd>new<cr>", "Split New Horizontal" },
		v = { "<cmd>vnew<cr>", "Split New Vertical" },
		S = { "<cmd>split<cr>", "Split Editor Horizontal" },
		V = { "<cmd>vsplit<cr>", "Split Editor Vertical" },
	},
	b = {
		name = "Buffers",
		j = { "<cmd>BufferPrevious<cr>", "Previous Buffer (C-,)" },
		k = { "<cmd>BufferNext<cr>", "Next Buffer (C-.)" },
		J = { "<cmd>BufferMovePrevious<cr>", "Move Buffer to Previous (C-j)" },
		K = { "<cmd>BufferMoveNext<cr>", "Move Buffer to Next (C-k)" },
		q = { "<cmd>bdelete<cr>", "Close Buffer" }
	},
	t = {
		name = "Telescope",
		p = { "<cmd>Telescope find_files<cr>", "Find Files (C-p)" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep strings live in cwd (C-g)" },
		s = { "<cmd>Telescope grep_string<cr>", "Grep strings under cursor" },
		b = { "<cmd>Telescope buffers<cr>", "List Buffers (C-b)" },
		h = { "<cmd>Telescope help_tags<cr>", "Help (C-S-h)" },
		k = { "<cmd>Telescope keymaps<cr>", "List all keymaps" },
		f = { "<cmd>Telescope possession list<cr>", "List all sessions" },
	},
	h = {
		name = "Harpoon",
		h = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark current file" },
		b = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Lists all marks" },
		m = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next marks" },
		n = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev marks" },
	}
}

wk.register(mappings, vim.g.ops)

-- QoL
map("n", "P", '"0p', opts)
map("i", "jk", "<ESC>", opts)

-- save & quit
map("i", "<c-s>", "<ESC><cmd>w!<cr>", opts)
map("n", "<c-s>", "<ESC><cmd>w!<cr>", opts)
map("n", "<c-q>", "<cmd>q!<cr>", opts)

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
map("n", "<C-S-w>", "<cmd>bdelete!<cr>", opts)

-- Move to previous/next
map("n", "<A-h>", "<Cmd>BufferPrevious<cr>", opts)
map("n", "<A-l>", "<Cmd>BufferNext<cr>", opts)
map("n", "<A-H>", "<cmd>BufferMovePrevious<cr>", opts)
map("n", "<A-L>", "<cmd>BufferMoveNext<cr>", opts)

-- comment line
map("n", "<C-/>", "<cmd>CommentToggle<cr>", opts)
map("v", "<C-/>", "<cmd>'<,'>CommentToggle<cr>", opts)

-- telescope
map("n", "<C-p>", "<cmd>Telescope find_files preview_cutoff=1<cr>", opts)
map("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
map("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<C-b>", "<cmd>Telescope buffers<cr>", opts)
map("n", "<C-S-h>", "<cmd>Telescope help_tags<cr>", opts)

-- terminal
for var = 1, 9 do
	local key = string.format("<C-%s>", var)
	local term = string.format("<cmd>%sToggleTerm<cr>", var)
	map("n", key, term, opts)
end
