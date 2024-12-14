local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.opt_local.spell = true
vim.opt_local.linebreak = true

-- map("n", "<leader>mr", "<cmd>TermExec cmd='glow %'<cr>", opts)
map("n", "<leader>mr", "<cmd>TermExec cmd='glow %:p:h'<cr>", opts)
map("n", "<leader>mt", "<cmd>ToggleCheckbox<cr>", opts)
map("n", "<leader>mm", "<cmd>MarkdownPreviewToggle<cr>", opts)
