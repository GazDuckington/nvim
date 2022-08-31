-- GazDuckington

-- import inits
require('settings')
require('keybinding')
require('autos')
require('plugins')
require('tsconfig')
require('colorscheme')
require('statusline')
require('lsconfig')
require('autocmp')

require('nvim-ts-autotag').setup()
require('nvim-autopairs').setup()
require('nvim_comment').setup()

require('bufferline').setup({
  clickable = true
})

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
