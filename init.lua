-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
-- https://gtihub.com/GazDuckington/nvim

local reload = require("reload")
vim.opt.termguicolors = true

-- load plugins
require("plugins")
-- core settings
reload("core.vscode")
reload("core.settings")
reload("core.commands")
reload("core.keybinding")
reload("core.autocommands")
-- plugins config
reload("config.colorscheme")
reload("config.illuminate")
reload("config.toggleterm")
reload("config.treesitter")
reload("config.autopairs")
reload("config.telescope")
reload("config.colorizer")
reload("config.gitsigns")
-- reload("config.yazi")
reload("config.nvimtree")
reload("config.whichkey")
-- reload("config.codeium")
reload("config.greyjoy")
reload("config.lualine")
reload("config.indent")
reload("config.spider")
-- reload("config.focus")
reload("config.mason")
reload("config.boole")
reload("config.tint")
reload("config.lsp")
reload("config.ufo")
