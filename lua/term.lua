local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end
vim.opt.shell = "/usr/bin/fish"
require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-t>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
  direction = 'float',
  shell = vim.o.shell
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

-- tool
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit",  dir='%:p:h',hidden = true })
local floatterm = Terminal:new({ cmd = "fish", dir='%:p:h', hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

function _FLOAT_TOGGLE()
	floatterm:toggle()
end
