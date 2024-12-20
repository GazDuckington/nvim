local wk = require("which-key")
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "mr", "<cmd>TermExec cmd='python %'<cr>", opts)

wk.add({ "<leader>V", "<cmd>VenvSelect<cr>", desc = "Select python venv" })

-- init something
-- require("venv-selector").retrieve_from_cache()
