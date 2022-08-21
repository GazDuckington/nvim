-- init.lua
require('plugins')
require('keybinds')
require('coc-config')
-- require('autotag')
require('term')
require('lualine-conf')
require('bufferline-conf')
require('nvim-ts-autotag').setup()
require('nvim-autopairs').setup()
require('nvim_comment').setup()

--
vim.cmd([[autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')]])
--
vim.cmd([[autocmd BufWritePre *.py :silent call CocAction('runCommand', 'pyright.organizeimports')]])
--

-- vscode
require('vscode').setup({
  transparent = true,
  color_overrides = {
    Cursor = { bg='#EC2864' }
  }
})

-- treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

-- telescope
require('telescope').setup({
  pickers = {
    find_filse = {
      theme = "vscode"
    }
  }
})

-- general settings
vim.o.termguicolors = true

-- thin separator
vim.cmd([[au ColorScheme * hi WinSeparator guibg=none]])
-- vim.cmd [[set autochdir]]
-- vim.cmd([[autocmd VimEnter * cd %:p:h]])
-- vim.cmd([[autocmd BufEnter * cd %:p:h]])
-- vim.cmd([[au ColorScheme * hi Normal ctermbg=none guibg=#1d1c1a]])
vim.g.netrw_winsize = 20

-- colorscheme
vim.g.vscode_style = "dark"
vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd [[colorscheme vscode]]

-- mouse
vim.cmd [[set mouse=a]]
vim.opt.hidden = true

-- indentation
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.smartindent = true
vim.opt.number = true

