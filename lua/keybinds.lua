local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- local telescope = require("telescope")

-- set leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- basic keybind
-- file explorer
map('n', '<leader>e', ':Vexplore<CR>', opts)
-- save & quit
map('n', '<c-s>', ':w<CR>', {})
map('n', '<c-w>', ':bd!<CR>', {})
map('n', '<c-q>', ':q<CR>', {})
-- replace selected text
map("n", "<c-f>", ":%s/", {})
-- comment line
map("n", "gc", ":CommentToggle<CR>", {})
map("v", "gc", ":'<,'>CommentToggle<CR>", {})
-- move line up & down
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==", opts)
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==", opts)
map("v", "<A-k>", "<Esc><cmd>m '<-2<CR>gv=gv", opts)
map("v", "<A-j>", "<Esc><cmd>m '>+1<CR>gv=gv", opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- telescope
map('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
map('n', '<C-F>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
map('n', '<C-B>', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)

-- toggle terminal
map('n', '<c-t>', "<cmd>ToggleTerm dir='%:p:h'<CR>", opts)
map('n', '<leader>g', "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
