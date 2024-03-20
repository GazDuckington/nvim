vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

local map = vim.keymap.set
local opts = vim.g.opts

map("n", "mr", "<cmd>TermExec cmd='python %'<cr>", opts)

-- init something
require("venv-selector").retrieve_from_cache()
