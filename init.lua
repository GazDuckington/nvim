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
require("core.settings")
require("core.keybinding")
require("core.autocommands")
-- plugins config
reload("config.colorscheme")
reload("config.toggleterm")
reload("config.treesitter")
-- reload("config.autopairs")
reload("config.telescope")
reload("config.gitsigns")
reload("config.nvimtree")
reload("config.whichkey")
reload("config.greyjoy")
reload("config.lualine")
reload("config.indent")
reload("config.focus")
reload("config.boole")
reload("config.mason")
reload("config.null")
reload("config.lsp")
