-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
-- https://gtihub.com/GazDuckington/nvim

require("plugins")
require("impatient")

-- core settings
require("core.settings")
require("core.keybinding")
require("core.autocommands")

-- plugins configurations
require("config.catppuccin")
require("config.focus")
require("config.gitsigns")
require("config.greyjoy")
require("config.indent")
require("config.lsp")
require("config.lualine")
require("config.nvimtree")
require("config.telescope")
require("config.toggleterm")
require("config.treesitter")
require("config.whichkey")

-- needs to be loaded here for some reason
require("lspconfig").sumneko_lua.setup({
	settings = {
		diagnostics = {
			globals = { "vim" }
		}
	}
})
