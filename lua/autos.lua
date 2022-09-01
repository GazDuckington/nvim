local api = vim.api
local gpinit = api.nvim_create_augroup("Init", {clear=true})

-- Auto-reload init.lua on save
local reload = function () vim.cmd [[so %]] end
api.nvim_create_autocmd("BufWritePost", {
	pattern="init.lua",
	callback=reload,
  	group=gpinit
})

-- Run PackerSync on save
api.nvim_create_autocmd("BufWritePost", {
	pattern="plugins.lua",
	callback=function ()
    		vim.cmd[[so % | PackerSync]]
  	end,
	group=gpinit
})
