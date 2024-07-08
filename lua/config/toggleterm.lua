local status_ok, _ = pcall(require, "toggleterm")
if not status_ok then
	return
end

local opts = vim.g.opts

require("toggleterm").setup {
	size = 10,
	open_mapping = [[<A-`>]],
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	close_on_exit = true,
	persist_size = true,
	direction = "float",
	float_ops = {
		border = "curved",
		winblend = 0,
	}
}

local bmap = vim.api.nvim_buf_set_keymap
function _G.set_terminal_keymaps()
	bmap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
	bmap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
	bmap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
	bmap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
	bmap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", dir = "%:p:h", direction = "float", hidden = true })

-- function _LAZYGIT_TOGGLE()
-- lazygit:toggle()
-- end

-- keybindings
for var = 1, 9 do
	local map = vim.keymap.set
	local key = string.format("<leader>%s", var)
	local term = string.format("<cmd>%sToggleTerm<cr>", var)
	map("n", key, term, opts)
end
