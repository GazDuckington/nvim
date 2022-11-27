local mappings = {
	c = {
		name = string.format("%s runner", vim.bo.filetype),
		r = { '<cmd>TermExec cmd="lua %"<cr>', "read current file" },
		-- R = { '<cmd>TermExec cmd="lua %:p:h"<cr>', "read current dir" }
	}
}
require("which-key").register(mappings, vim.g.ops)
