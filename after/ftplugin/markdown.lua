local o = vim.opt_local
local map = vim.api.nvim_set_keymap
local opts = vim.g.opts

o.spell = true
o.linebreak = true

map("n", "mr", "<cmd>TermExec cmd='glow %'<cr>", opts)
map("n", "mR", "<cmd>TermExec cmd='glow %:p:h'<cr>", opts)
map("n", "mt", "<cmd>ToggleCheckbox<cr>", opts)
map("n", "mp", "<cmd>MarkdownPreview<cr>", opts)
map("n", "ms", "<cmd>MarkdownPreviewStop<cr>", opts)
map("n", "mm", "<cmd>MarkdownPreviewToggle<cr>", opts)
