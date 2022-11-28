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
require("config/lsp_config")
require("config/treesitter")
require("config/mason")
require("config/toggleterm")
require("config/telescope")
require("config/greyjoy")
require("config/indent")
require("config/nvimtree")
require("config/zen")
require("config/barbecue")

-- plugin inits (default settings)
require("nvim-autopairs").setup()
require("nvim_comment").setup()
require("dressing").setup()
require("leap").add_default_mappings()
require("colorizer").setup()

require("./plugin/packer_compiled")
