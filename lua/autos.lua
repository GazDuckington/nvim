local api = vim.api
local gpinit = api.nvim_create_augroup("Init", {clear=true})

-- Auto-reload init.lua on save
api.nvim_create_autocmd("BufWritePost", {
  pattern="init.lua",
  callback=function ()
    vim.cmd[[so %]]
  end,
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

-- autoformat on save
api.nvim_create_autocmd("BufWritePre", {
	pattern={"*"},
	callback=function ()
		vim.cmd [[lua vim.lsp.buf.formatting_sync()]]
	end,
	group=gpinit
})
