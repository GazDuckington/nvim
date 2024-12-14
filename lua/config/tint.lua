require('tint').setup({
	tint = -50,
	window_ignore_function = function(winid)
		local bufid = vim.api.nvim_win_get_buf(winid)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufid })
		local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

		-- Do not tint `terminal` or floating windows, tint everything else
		return buftype == "terminal" or floating
	end
})
