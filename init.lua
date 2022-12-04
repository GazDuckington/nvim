-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
-- https://gtihub.com/GazDuckington/nvim

-- general settings
require("impatient")
require("plugins")
require("settings")
require("keybinding")
require("colorscheme")
require("autocommands")

-- plugin configs
require("config/statusline")
require("config/whichkey")
require("config/lsp_config")
require("config/mason")
require("config/toggleterm")
require("config/telescope")
require("config/greyjoy")
require("config/indent")
require("config/nvimtree")
require("config/zen")
require("config/barbecue")
require("config/treesitter")
require("config/bufferline")
require("config/session")

-- plugins with default settings are setup on lua/plugins.lua
