-- colorscheme
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
  -- transparent_background = true,
  ts_rainbow = true,
  barbar = true,
  highlight_overrides = {
    all = { 
	Comment = { fg = '#6c7086' }
    }
  },
})
vim.cmd [[colorscheme catppuccin]]
