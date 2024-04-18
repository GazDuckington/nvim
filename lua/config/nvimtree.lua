local function open_tab_silent(node)
	local api = require("nvim-tree.api")
	api.node.open.tab(node)
	vim.cmd.tabprev()
end

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

require('nvim-tree').setup({
	view = {
		side = 'right',
		adaptive_size = false,
		number = true,
		relativenumber = true,
		float = {
			enable = false,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2)
						- vim.opt.cmdheight:get()
				return {
					border = 'rounded',
					relative = 'editor',
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		-- width = function()
		-- 	return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		-- end,
		-- mappings = {
		-- 	list = {
		-- 		{
		-- 			key = "t",
		-- 			action = "open_tab_silent",
		-- 			action_cb = open_tab_silent
		-- 		},
		-- 	}
		-- },
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "﫧",
					ignored = "◌",
				},
			},
		},
	},
})

-- open file on create
local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
	vim.cmd("edit " .. file.fname)
end)
