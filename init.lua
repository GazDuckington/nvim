-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
-- https://gtihub.com/GazDuckington/nvim

vim.opt.termguicolors = true

require("plugins")

local reload = require("reload")

-- core settings
reload("core.settings")
reload("core.keybinding")
reload("core.autocommands")

-- plugins config
reload("config.autopairs")
reload("config.catppuccin")
reload("config.focus")
reload("config.gitsigns")
reload("config.greyjoy")
reload("config.indent")
reload("config.lsp")
reload("config.lualine")
reload("config.nvimtree")
reload("config.telescope")
reload("config.toggleterm")
reload("config.treesitter")
reload("config.whichkey")
reload("config.boole")
reload("config.neoscroll")
reload("config.mason")
