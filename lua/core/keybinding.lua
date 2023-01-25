local wk = require("which-key")
local map = vim.keymap.set
local opts = vim.g.opts

local mappings = {
	["."] = { ":cd ~/.config/nvim<cr>:e init.lua<cr>", "Open Neovim Config" },
	e = { "<cmd>NvimTreeFindFileToggle<cr>", "Open tree view" },
	r = { "<cmd>Greyjoy<cr>", "Greyjoy launcher" },
	i = { "<cmd>cd %:p:h<cr>", "Cd to Buffer" },
	o = { ":e ", "Open/Create File" },
	c = { name = "Code options" },
	d = { name = "Diagnostics" },
	b = { name = "References" },
	g = { name = "Gitsigns" },
	s = { name = "Searches" },
	l = { name = "LSP" },
	m = {
		name = "Menus",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
		l = { "<cmd>Lazy<cr>", "Open Lazy.nvim menu" },
		m = { "<cmd>Mason<cr>", "Open Mason menu" },
		w = { ":saveas ", "Save buffer as" },
		i = { ":LspInfo<cr>", "LSP Info" },
	},
	q = {
		name = "Quickfix",
		N = { ":cprevious<cr>", "Previous" },
		o = { ":copen<cr>", "Open" },
		n = { ":cnext<cr>", "Next" },
	},
	v = {
		name = "Views",
		l = { "<cmd>FocusSplitRight<cr>", "Focus split right" },
		h = { "<cmd>FocusSplitLeft<cr>", "Focus split left" },
		j = { "<cmd>FocusSplitDown<cr>", "Focus split down" },
		k = { "<cmd>FocusSplitUp<cr>", "Focus split up" },
	},
	f = {
		name = "Helps",
		F = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Symbols in workspace" },
		f = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols in document" },
		k = { "<cmd>Telescope keymaps<cr>", "List all keymaps" },
		d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },

	},
	h = {
		name = "Harpoon",
		h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Marks" },
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark file" },
		m = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next marks" },
		n = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev marks" },
	}
}

wk.register(mappings, vim.g.ops)

-- QoL
map("i", "jk", "<ESC>", opts)
map("n", "P", '"0p', opts)
map("n", "J", "mzJ`z", opts)
map("n", "<c-d>", "<C-d>zz", opts)
map("n", "<c-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("x", "<leader>p", "\"_dP", opts)
map("i", "<c-o>", "<C-O>o", opts)

-- save & quit
map("i", "<c-s>", "<ESC><cmd>w!<cr>", opts)
map("n", "<c-s>", "<ESC><cmd>w!<cr>", opts)
map("n", "<c-q>", "<cmd>q!<cr>", opts)
map("n", "<space>S", "<cmd>mksession ~/.vim/sessions/%:p:h:t.vim<cr>", opts)

-- move line up & down
map("n", "<A-k>", ":m .-2<cr>==", opts)
map("n", "<A-j>", ":m .+1<cr>==", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- buffer controls
map("n", "W", "<cmd>bd<cr>", opts)
map("n", "H", "<cmd>bp<cr>", opts)
map("n", "L", "<cmd>bn<cr>", opts)
