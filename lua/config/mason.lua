local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lsp_zero = require("lsp-zero")
local servers = vim.g.must_lsp
local lspconfig = require('lspconfig')

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
	automatic_installation = true,
	handlers = {
		lsp_zero.default_setup,
		function(server_name)
			lspconfig[server_name].setup({})
		end,
		lua_ls = function()
			lspconfig.lua_ls.setup({
				on_init = function(client)
					lsp_zero.nvim_lua_settings(client, {})
				end,
			})
		end,
 volar = function()
      require('lspconfig').volar.setup({})
    end,
    ts_ls = function()
      local vue_typescript_plugin = require('mason-registry')
        .get_package('vue-language-server')
        :get_install_path()
        .. '/node_modules/@vue/language-server'
        .. '/node_modules/@vue/typescript-plugin'

      lspconfig.ts_ls.setup({
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_typescript_plugin,
              languages = {'javascript', 'typescript', 'vue'}
            },
          }
        },
        filetypes = {
          'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
          'vue',
        },
      })
		end
	},
})
