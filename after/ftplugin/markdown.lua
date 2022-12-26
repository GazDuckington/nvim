local o = vim.opt_local
local map = vim.api.nvim_set_keymap

o.spell = true
o.linebreak = true

local mappings = {
	c = {
		name = string.format("%s runner", vim.bo.filetype),
		r = { '<cmd>TermExec cmd="glow %"<cr>', "read current file" },
		R = { '<cmd>TermExec cmd="glow %:p:h"<cr>', "read current dir" }
	}
}
require("which-key").register(mappings, vim.g.opts)

map("n", "mt", "<cmd>ToggleCheckbox<cr>", vim.g.opts)
map("n", "mp", "<cmd>MarkdownPreview<cr>", vim.g.opts)
map("n", "ms", "<cmd>MarkdownPreviewStop<cr>", vim.g.opts)
map("n", "mm", "<cmd>MarkdownPreviewToggle<cr>", vim.g.opts)
