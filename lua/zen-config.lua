require('zen-mode').setup({
	window = {
		backdrop = .95,
		width = .85,
		height = .95
	},
	on_open = function()
		vim.opt.spell = true
		vim.opt.linebreak = true
	end,
	on_close = function()
		vim.opt.spell = false
		vim.opt.linebreak = false
	end
})
