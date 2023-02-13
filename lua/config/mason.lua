local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local servers = vim.g.must_lsp
mason_lspconfig.setup({
		ensure_installed = servers,
		automatic_installation = true,
})

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
