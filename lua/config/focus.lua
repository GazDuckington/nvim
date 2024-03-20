local excluded_filetypes = {
	'Navbuddy',
	'harpoon',
	'toggleterm',
	'TelescopePrompt',
	'NvimTree',
}
local excluded_buftypes = {
	-- 'help',
	'terminal',
	'prompt',
	'popup',
}

local augroup =
		vim.api.nvim_create_augroup('FocusDisable', { clear = true })

require("focus").setup()

vim.api.nvim_create_autocmd('WinEnter', {
	group = augroup,
	callback = function(_)
		if vim.tbl_contains(excluded_buftypes, vim.bo.buftype)
		then
			vim.w.focus_disable = true
		else
			vim.w.focus_disable = false
		end
	end,
	desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
	group = augroup,
	callback = function(_)
		if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
			vim.b.focus_disable = true
		else
			vim.b.focus_disable = false
		end
	end,
	desc = 'Disable focus autoresize for FileType',
})
