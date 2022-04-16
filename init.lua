require('plugins')
require('keybinds')
require('coc-config')
require('autotag')
require('term')
require('nvim-autopairs').setup{}
require('nvim_comment').setup()

vim.cmd [[
  augroup init_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | so ~/.config/nvim/init.lua
  augroup end
]]

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { "lua" }
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

-- bufferline
require("bufferline").setup({
    options = {
        buffer_close_icon = "",
        close_command = "bdelete! %d",
        close_icon = "",
        indicator_icon = " ",
        left_trunc_marker = "",
        modified_icon = "●",
        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
        right_mouse_command = "bdelete! %d",
        right_trunc_marker = "",
        show_close_icon = false,
        show_tab_indicators = true,
    },
    highlights = {
        fill = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        background = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLine" },
        },
        buffer_visible = {
            gui = "",
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        buffer_selected = {
            gui = "",
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        separator = {
            guifg = { attribute = "bg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator_selected = {
            guifg = { attribute = "fg", highlight = "Special" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        separator_visible = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        close_button = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLine" },
        },
        close_button_selected = {
            guifg = { attribute = "fg", highlight = "normal" },
            guibg = { attribute = "bg", highlight = "normal" },
        },
        close_button_visible = {
            guifg = { attribute = "fg", highlight = "normal" },
            guibg = { attribute = "bg", highlight = "normal" },
        },
    },
})

-- status line
require('lualine').setup{
  options = {
    theme = 'vscode',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
}

-- general settings
vim.o.termguicolors = true
vim.cmd([[au ColorScheme * hi WinSeparator guibg=none]]) -- Thin separator
-- colorscheme
vim.g.vscode_style = "dark"
vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd([[colorscheme vscode]])
-- mouse
vim.cmd [[set mouse=a]]
vim.opt.hidden = true

-- indentation
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.smartindent = true
vim.opt.number = true
