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
require("autocommands")
require("colorscheme")

-- plugin configs
require("config/statusline")
require("config/bufferline")
require("config/whichkey")
require("config/ls")
require("config/ts")
require("config/mason")
require("config/toggleterm")
require("config/telescope")
require("config/greyjoy")
require("config/indent")
require("config/nvimtree")
require("config/zen")
require("config/bbq")

-- plugin inits
require("nvim-autopairs").setup()
require("nvim_comment").setup()
require("dressing").setup()
require("leap").add_default_mappings()
require("colorizer").setup()
