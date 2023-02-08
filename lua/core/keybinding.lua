local wk = require("which-key")
local map = vim.keymap.set
local opts = vim.g.opts

local mappings = {
	["."] = { ":cd ~/.config/nvim<cr>:e init.lua<cr>", "Open Neovim Config" },
	e = { "<cmd>NvimTreeFindFileToggle<cr>", "Open tree view" },
	r = { "<cmd>Greyjoy<cr>", "Greyjoy launcher" },
	i = { "<cmd>cd %:p:h<cr>", "Cd to Buffer" },
	o = { ":e ", "Open/Create File" },
	b = { name = "Buffers" },
	s = { name = "Searches" },
	l = { name = "LSP" },
	t = { name = "GitSigns" },
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
		k = { "<cmd>Telescope keymaps<cr>", "List all keymaps" },
		h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },

	},
	h = {
		name = "Harpoon",
		u = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Marks" },
		h = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark file" },
		k = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next marks" },
		j = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev marks" },
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
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map("n", "<A-w>", "<cmd>BufferClose<cr>", opts)
map("n", "<A-h>", "<cmd>BufferPrevious<cr>", opts)
map("n", "<A-l>", "<cmd>BufferNext<cr>", opts)
--
map('n', '<A-H>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-L>', '<Cmd>BufferMoveNext<CR>', opts)
--
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- magic buffer picking
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
