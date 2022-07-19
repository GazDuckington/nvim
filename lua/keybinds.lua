local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- set leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- basic keybind
map('n', '<c-h>', ':noh<CR>', opts)

-- file explorer
map('n', '<leader>e', ':Texplore %d<CR>', opts)
map('n', '<leader>z', '<c-w>z<CR>', opts)
map('n', '<leader>1', ':BufferLineCyclePrev<CR>', opts)
map('n', '<leader>2', ':BufferLineCycleNext<CR>', opts)
map('n', '<c-Tab>', ':BufferLineCycleNext<CR>', opts)

-- save & quit
map('i', '<c-s>', '<ESC>:w<CR>', {})
map('n', '<c-s>', '<ESC>:w<CR>', {})
map('n', '<c-d>', ':bd!<CR>', {})
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
map("i", "<c-o>", "<C-O>o", opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-w>", ":bdelete<CR>", opts)

-- telescope
map('n', '<C-P>', "<cmd>Telescope fd<CR>", opts)
map('n', '<C-F>', "<cmd>Telescope live_grep<CR>", opts)
map('n', '<C-B>', "<cmd>Telescope buffers<CR>", opts)

-- toggle terminal
map('n', '<leader>g', "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- rest.nvim
map('n', '<leader>t', "<Plug>RestNvim<CR>", opts)

-- paste from clipboard
map('v', '<C-S-c>', '"+y', opts)
map('n', '<C-S-c>', '"+y', opts)
map('v', '<C-S-x>', '"+d', opts)
map('n', '<C-S-x>', '"+d', opts)

-- preview pdf
map('n', '<leader>o', ':!zathura --synctex-forward :: %:r.pdf<CR>:redraw!<CR>', opts)
