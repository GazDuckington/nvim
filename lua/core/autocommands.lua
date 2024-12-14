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
-- autocmd("BufWritePost", {
-- 	pattern = "plugins.lua",
-- 	callback = function()
-- 		vim.cmd([[Lazy sync]])
-- 	end,
-- 	group = gpinit,
-- })

local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
autocmd("User", {
	pattern = "NvimTreeSetup",
	callback = function()
		local events = require("nvim-tree.api").events
		events.subscribe(events.Event.NodeRenamed, function(data)
			if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
				data = data
				Snacks.rename.on_rename_file(data.old_name, data.new_name)
			end
		end)
	end,
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
	pattern = {
		[".env"] = "config",
		["*.rasi"] = "scss",
		['.*%.blade%.php'] = 'blade',
	},
})

autocmd(
	{ "BufEnter", "BufNewFile", "BufRead" },
	{
		pattern = { ".env" },
		callback = function()
			vim.cmd([[setfiletype config]])
		end,
		group = gpinit,
	}
)

autocmd(
	{ "BufEnter", "BufNewFile", "BufRead" },
	{
		pattern = { "*.rasi" },
		callback = function()
			vim.cmd([[setfiletype sass]])
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

-- auto cd to dir
autocmd(
	{ "VimEnter" },
	{
		pattern = { "*" },
		callback = function(data)
			-- Check if the argument is a directory
			if vim.fn.isdirectory(data.file) == 1 then
				-- Change to the directory
				vim.cmd("cd " .. data.file)
			end
		end
	}
)
