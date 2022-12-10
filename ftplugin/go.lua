local mappings = {
	c = {
		name = string.format("%s Runner", vim.bo.filetype),
		r = { '<cmd>TermExec cmd="go run %"<cr>', "read current file" },
		R = { '<cmd>TermExec cmd="go run ." dir="%:p:h"<cr>', "read current dir" },
		b = { '<cmd>TermExec cmd="go build -o %:p:h/bin/ ." dir="%:p:h"<cr>', "build current dir" },
		i = { '<cmd>TermExec cmd="go run ." dir="%:p:h"<cr>', "read current dir" },
	}
}
require("which-key").register(mappings, vim.g.ops)
vim.opt.spell = false
vim.opt.linebreak = false
