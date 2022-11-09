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
	["."] = { ":cd ~/.config/nvim<cr>:e init.lua<cr>", "Open Neovim Config" },
	q = { ":q!<cr>", "Quit (C-q)" },
	s = { ":w!<cr>", "Save (C-s)" },
	["/"] = { "<cmd>CommentToggle<cr>", "Comment Line (C-/)" },
	i = { ":cd %:p:h<cr>", "Cd to Buffer" },
	e = { ":e ", "Open/Create File" },
	g = { ":lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
	x = { "<cmd>TroubleToggle quickfix<cr>", "Open diagnostics" },
	v = {
		name = "Split View",
		s = { ":new<cr>", "Split New Horizontal" },
		v = { ":vnew<cr>", "Split New Vertical" },
		S = { ":split<cr>", "Split Editor Horizontal" },
		V = { ":vsplit<cr>", "Split Editor Vertical" },
	},
	b = {
		name = "Buffer Control",
		j = { ":BufferPrevious<cr>", "Previous Buffer (C-,)" },
		k = { ":BufferNext<cr>", "Next Buffer (C-.)" },
		J = { ":BufferMovePrevious<cr>", "Move Buffer to Previous (C-1)" },
		K = { ":BufferMoveNext<cr>", "Move Buffer to Next (C-2)" },
		q = { ":bdelete<cr>", "Close Buffer" }
	},
	p = {
		name = "Writer Stuff",
		e = { ":lua _EXPORT_PDF()<cr>", "Export to PDF" },
		r = { ":lua _READ_PDF()<cr>", "Read File" },
		-- r = { ":!zathura --synctex-forward :: %:r.pdf &<cr>:redraw!<cr>", "Read in Zathura" },
	},
	r = {
		name = "Code Runner",
		-- g = { ":TermExec cmd='go run %:p:r.go' dir='%:p:h'<cr>", "Golang" },
		-- p = { ":TermExec cmd='python %:p:r.py' dir='%:p:h'<cr>", "Python" },
		r = { ":lua _RUNNER()<cr>", "Run File" },
		n = { ":TermExec cmd='pnpm run dev -- --open' dir='%:p:h'<cr>", "Node Dev Server" },
	},
	t = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find Files (C-f)" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep String (C-g)" },
		b = { "<cmd>Telescope buffers<cr>", "List Buffers (C-b)" },
		h = { "<cmd>Telescope help_tags<cr>", "Help (C-h)" },
	},
}

local wk = require("which-key")
wk.register(mappings, ops)

-- QoL
map("n", "P", '"0p', opts)
map("n", ";", ":", opts)
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

-- Re-order to previous/next
map("n", "<leader>j", "<Cmd>BufferMovePrevious<cr>", opts)
map("n", "<leader>k", "<Cmd>BufferMoveNext<cr>", opts)

-- comment line
map("n", "<C-/>", ":CommentToggle<cr>", opts)
map("v", "<C-/>", ":'<,'>CommentToggle<cr>", opts)

-- export buffer to pdf
map("n", "<C-p>", "<cmd>lua _EXPORT_PDF()<cr>", opts)

-- telescope
map("n", "<C-f>", "<cmd>Telescope find_files preview_cutoff=1<cr>", opts)
map("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<C-b>", "<cmd>Telescope buffers<cr>", opts)
map("n", "<C-S-h>", "<cmd>Telescope help_tags<cr>", opts)

-- terminal
for var = 1, 3 do
	local key = string.format("<C-%s>", var)
	local term = string.format("<cmd>%sToggleTerm<cr>", var)
	map("n", key, term, opts)
end
