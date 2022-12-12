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
		vim.lsp.buf.format()
	end,
	group = gpinit,
})

-- filetype management
autocmd(
	{ "BufEnter", "BufNewFile", "BufRead" },
	{
		pattern = { "*" },
		callback = function()
			require('filetype').resolve()
		end,
		group = gpinit,
	}
)

-- Show line diagnostics automatically in hover window
autocmd(
	{ "CursorHold", "CursorHoldI" },
	{
		pattern = { "*" },
		callback = function()
			vim.diagnostic.open_float(nil, { focus = false })
		end,
		group = gpinit,
	}
)
