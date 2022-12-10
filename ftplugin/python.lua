local o = vim.opt
local mappings = {
	c = {
		name = string.format("%s runner", vim.bo.filetype),
		r = { '<cmd>TermExec cmd="python %"<cr>', "read current file" },
		R = { '<cmd>TermExec cmd="python %:p:h"<cr>', "read current dir" }
	}
}
require("which-key").register(mappings, vim.g.ops)

-- indentation
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.spell = false
o.linebreak = false
