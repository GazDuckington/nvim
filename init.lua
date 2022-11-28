-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
-- https://gtihub.com/GazDuckington/nvim

-- user settings
require("impatient")
require("plugins")
require("lsconfig")
require("mason-config")
require("settings")
require("keybinding")
require("autos")
require("tsconfig")
require("colorscheme")
require("statusline")
require("term")
require("teleconfig")
require("whichkey")
require("gjoy")
require("indent-config")
require("nvimtree-config")
require("zen-config")
require("bbq-config")

require("nvim-autopairs").setup()
require("nvim_comment").setup()
require("dressing").setup()
require("leap").add_default_mappings()
require("colorizer").setup()
