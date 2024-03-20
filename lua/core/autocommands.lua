local api = vim.api
local autocmd = api.nvim_create_autocmd
local gpinit = api.nvim_create_augroup("Init", { clear = true })

-- Auto-reload init.lua on save
autocmd("BufWritePost", {
	pattern = "init.lua",
	callback = function()
		vim.cmd([[source $MYVIMRC]])
	end,
	group = gpinit,
})

-- Run PackerSync on save
autocmd("BufWritePost", {
	pattern = "plugins.lua",
	callback = function()
		vim.cmd([[Lazy sync]])
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
vim.filetype.add({
	filename = {
		[".env"] = function()
			return "config"
		end,
	},
})

-- autocmd(
-- 	{ "BufEnter", "BufNewFile", "BufRead" },
-- 	{
-- 		-- pattern = { "*" },
-- 		callback = function()
-- 			require("filetype").resolve()
-- 		end,
-- 		group = gpinit,
-- 	}
-- )

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

-- nvim-tree
autocmd(
	{ "VimEnter" },
	{
		callback = function(data)
			local directory = vim.fn.isdirectory(data.file) == 1
			if not directory then return end
			-- cd to directory
			vim.cmd.cd(data.file)
			-- open the tree
			require("nvim-tree.api").tree.open()
		end
	}
)
