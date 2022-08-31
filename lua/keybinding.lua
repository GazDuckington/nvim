local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- set leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- save & quit
map('i', '<c-s>', '<ESC>:w!<CR>', opts)
map('n', '<c-s>', '<ESC>:w!<CR>', opts)
map('n', '<c-q>', ':q!<CR>', opts)

-- move line up & down
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==", opts)
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==", opts)
map("v", "<A-k>", "<Esc><cmd>m '<-2<CR>gv=gv", opts)
map("v", "<A-j>", "<Esc><cmd>m '>+1<CR>gv=gv", opts)
map("i", "<c-o>", "<C-O>o", opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- close buffer
map("n", "<C-w>", ":bdelete<CR>", opts)

-- Move to previous/next
map('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<C-1>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<C-2>', '<Cmd>BufferMoveNext<CR>', opts)

-- comment line
map("n", "<C-/>", ":CommentToggle<CR>", opts)
map("v", "<C-/>", ":'<,'>CommentToggle<CR>", opts)
