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
  ["."] = {":cd ~/.config/nvim<cr>:e init.lua<cr>", "Open Neovim Config"},
  q = { ":q!<cr>", "Quit" },
  s = { ":w!<cr>", "Save" },
  ["/"] = { "<cmd>CommentToggle<cr>", "Comment Line" },
  i = { ":cd %:p:h<cr>", "CD to Buffer" },
  e = { ":e ", "Open/Create File" },
  v = {
    name = "Split View",
    s = {":new<cr>", "Split New Horizontal"},
    v = {":vnew<cr>", "Split New Vertical"},
    S = {":split<cr>", "Split Editor Horizontal"},
    V = {":vsplit<cr>", "Split Editor Vertical"},
  },
  b = {
    name = "Buffer Control",
    j = {":BufferPrevious<cr>", "Previous Buffer"},
    k = {":BufferNext<cr>", "Next Buffer"},
    J = {":BufferMovePrevious<cr>", "Move Buffer to Previous"},
    K = {":BufferMoveNext<cr>", "Move Buffer to Next"},
    q = {":bdelete<cr>", "Close Buffer"}
  },
  p = {
    name = "Writer Stuff",
    m = { ":!pandoc % -o %:r.pdf<cr>:redraw!<cr>", "Markdown to PDF"},
    t = { ":!pdflatex % -o %:r.pdf<cr>:redraw!<cr>", "LaTeX to PDF"},
    r = { ":zathura --synctex-forward :: %:r.pdf &<cr>:redraw!<cr>", "Read in Zathura" }
  }
}

local wk = require("which-key")
wk.register(mappings, ops)

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
