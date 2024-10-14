local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lsp_zero = require("lsp-zero")
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
		lsp_zero.default_setup,
		-- function(server_name)
		-- require('lspconfig')[server_name].setup({})
		-- end,
		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				on_init = function(client)
					lsp_zero.nvim_lua_settings(client, {})
				end,
			})
		end,
	},
	automatic_installation = true,
})
