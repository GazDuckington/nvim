-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
-- https://gtihub.com/GazDuckington/nvim
local reload = require("reload")
local lspconfig = require("lspconfig")

require("plugins")

-- core settings
reload("core.settings")
reload("core.keybinding")
reload("core.autocommands")

-- plugins config
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

lspconfig.sourcery.setup({
	init_options = {
		token = os.getenv('SOURCERY_TOKEN')
	}
})

lspconfig.sumneko_lua.setup({
	settings = {
		diagnostics = {
			globals = { "vim" }
		}
	}
})
