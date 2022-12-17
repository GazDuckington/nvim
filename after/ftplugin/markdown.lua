local o = vim.opt_local
o.spell = true
o.linebreak = true

local mappings = {
	c = {
		name = string.format("%s runner", vim.bo.filetype),
		r = { '<cmd>TermExec cmd="glow %"<cr>', "read current file" },
		R = { '<cmd>TermExec cmd="glow %:p:h"<cr>', "read current dir" }
	}
}
require("which-key").register(mappings, vim.g.ops)
