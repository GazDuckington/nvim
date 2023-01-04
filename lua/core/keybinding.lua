local wk = require("which-key")
local map = vim.keymap.set
local opts = vim.g.opts

local mappings = {
	i = { "<cmd>cd %:p:h<cr>", "Cd to Buffer" },
	["."] = { ":cd ~/.config/nvim<cr>:e init.lua<cr>", "Open Neovim Config" },
	e = { "<cmd>NvimTreeFindFileToggle<cr>", "Open tree view" },
	l = { "<cmd>Greyjoy<cr>", "Greyjoy launcher" },
	o = { ":e ", "Open/Create File" },
	w = { ":saveas ", "Save buffer as" },
	d = { name = "Diagnostics" },
	s = { name = "Symbols" },
	m = { "<cmd>Mason<cr>", "Open Mason menu" },
	g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
	h = {
		name = "Gitsigns",
		b = "full blame line",
		D = "diff this file HEAD~",
	},
	q = {
		name = "Quickfix",
		o = { ":copen<cr>", "Open" },
		n = { ":cnext<cr>", "Next" },
		N = { ":cprevious<cr>", "Previous" },
	},
	v = {
		name = "Views",
		h = { "<cmd>FocusSplitLeft<cr>", "Focus split left" },
		l = { "<cmd>FocusSplitRight<cr>", "Focus split right" },
		k = { "<cmd>FocusSplitUp<cr>", "Focus split up" },
		j = { "<cmd>FocusSplitDown<cr>", "Focus split down" },
	},
	t = {
		name = "Telescope Searches",
		h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
		k = { "<cmd>Telescope keymaps<cr>", "List all keymaps" },
		d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		f = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols in document" },
		F = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Symbols in workspace" },

	},
	n = {
		name = "Harpoon",
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark file" },
		h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Marks" },
		m = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next marks" },
		n = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev marks" },
	}
}

wk.register(mappings, vim.g.ops)

-- QoL
map("i", "jk", "<ESC>", opts)
map("n", "P", '"0p', opts)
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
map("n", "<space>S", "<cmd>mksession ~/vimsession/%:p:h:t.vim<cr>", opts)

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

-- telescope
map("n", "<C-p>", "<cmd>Telescope git_files<cr>", opts)
map("n", "<C-f>", "<cmd>Telescope find_files<cr>", opts)
map("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<C-n>", "<cmd>Telescope buffers<cr>", opts)

-- terminal
for var = 1, 9 do
	local key = string.format("<C-%s>", var)
	local term = string.format("<cmd>%sToggleTerm<cr>", var)
	map("n", key, term, opts)
end

-- lsp stuff
map("n", "<leader>tr", "<cmd>Telescope lsp_references<cr>", opts)
map("n", "<leader>sd", "<cmd>Telescope lsp_document_symbols<cr>", opts)
map("n", "<leader>sw", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)
map("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
map("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
map("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
map("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
map("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
