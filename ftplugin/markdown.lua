local ops = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = false, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}
local mappings = {
	d = {
		name = "Read Markdown",
		r = { "<cmd>TermExec cmd=glow %<cr>", "read current file" },
		d = { "<cmd>TermExec cmd=glow %:p:h<cr>", "read current dir" }
	}
}
local wk = require("which-key")

wk.register(mappings, ops)

vim.opt.undofile = true
vim.opt.spell = true
vim.opt.linebreak = true
