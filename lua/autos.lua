local api = vim.api
local autocmd = api.nvim_create_autocmd
local gpinit = api.nvim_create_augroup("Init", { clear = true })

-- Auto-reload init.lua on save
autocmd("BufWritePost", {
	pattern = "init.lua",
	callback = function()
		vim.cmd([[so %]])
	end,
	group = gpinit,
})

-- Run PackerSync on save
autocmd("BufWritePost", {
	pattern = "plugins.lua",
	callback = function()
		vim.cmd([[so % | PackerSync]])
	end,
	group = gpinit,
})

-- autoformat on save
autocmd("BufWritePre", {
	pattern = { "*" },
	callback = function()
		vim.cmd("lua vim.lsp.buf.format()")
	end,
	group = gpinit,
})
