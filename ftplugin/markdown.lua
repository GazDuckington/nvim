local mappings = {
	c = {
		name = string.format("%s runner", vim.bo.filetype),
		r = { '<cmd>TermExec cmd="glow %"<cr>', "read current file" },
		R = { '<cmd>TermExec cmd="glow %:p:h"<cr>', "read current dir" }
	}
}
require("which-key").register(mappings, vim.g.ops)

vim.opt.spell = true
vim.opt.linebreak = true
