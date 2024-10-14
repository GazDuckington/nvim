local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local servers = vim.g.must_lsp

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}
mason.setup(settings)

mason_lspconfig.setup({
	ensure_installed = servers,
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
	automatic_installation = true,
})
