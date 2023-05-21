local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then return end

lazy.setup(
	{
		{
			"kylechui/nvim-surround",
			version = "*",
			event = "VeryLazy",
		},

		-- LSP
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v1.x',
			dependencies = {
				-- LSP Support
				{ 'neovim/nvim-lspconfig' },         -- Required
				{ 'williamboman/mason.nvim' },       -- Optional
				{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
				{
					"jose-elias-alvarez/null-ls.nvim",
					dependencies = { "nvim-lua/plenary.nvim" }
				},

				-- Autocompletion
				{ 'hrsh7th/nvim-cmp' },     -- Required
				{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
				{ 'hrsh7th/cmp-buffer' },   -- Optional
				{ 'hrsh7th/cmp-path' },     -- Optional
				{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
				{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

				-- Snippets
				{ 'L3MON4D3/LuaSnip' },         -- Required
				{ 'rafamadriz/friendly-snippets' }, -- Optional
			}
		},

		{
			"folke/trouble.nvim",
			cmd = { "TroubleToggle", "Trouble" },
			event = "VeryLazy",
			opts = {
				use_diagnostic_signs = true,
				action_keys = {
					close = { "q", "<esc>" },
					cancel = "<c-e>"
				}
			}
		},

		-- tabnine
		{
			"tzachar/cmp-tabnine",
			build = "./install.sh",
			event = "InsertEnter",
		},
		{
			"codota/tabnine-nvim",
			build = "./dl_binaries.sh",
			event = "VeryLazy",
			config = function()
				require("tabnine").setup({
					disable_auto_comment = true,
					accept_keymap = "<C-space>",
					dismiss_keymap = "<C-]>",
					debounce_ms = 800,
					suggestion_color = { gui = "#808080", cterm = 244 },
					exclude_filetypes = { "TelescopePrompt" }
				})
			end
		},

		-- Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			"p00f/nvim-ts-rainbow",
			event = "BufReadPost",
		},
		-- auto tag for html
		{
			"windwp/nvim-ts-autotag",
			ft = vim.g.web_filetypes,
			event = "InsertEnter",
		},

		-- autoclose brackets and stuff
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
		},

		-- terminal
		{
			"akinsho/toggleterm.nvim",
			event = "VeryLazy",
		},

		-- telescope
		{
			"nvim-telescope/telescope.nvim",
			event = "VeryLazy",
			dependencies = {
				"nvim-lua/plenary.nvim",
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make"
				},
				"olacin/telescope-cc.nvim"
			},
		},

		-- which key
		{
			"folke/which-key.nvim",
			event = "VeryLazy"
		},

		-- colorizer
		{
			"norcalli/nvim-colorizer.lua",
			event = "VeryLazy",
			config = function()
				require("colorizer").setup()
			end,
		},

		-- file explorer
		{
			"nvim-tree/nvim-tree.lua",
			event = "VeryLazy",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			tag = "nightly",
		},

		-- indentation lines
		{
			"lukas-reineke/indent-blankline.nvim",
			event = "BufReadPre"
		},

		-- comment
		{
			"numToStr/Comment.nvim",
			config = function()
				require('Comment').setup({
					toggler = {
						line = '<C-c>',
					},
					opleader = {
						line = '<C-c>',
					}
				})
			end,
			event = "BufEnter"
		},
		{
			"folke/todo-comments.nvim",
			event = "VeryLazy",
			dependencies = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup()
			end
		},

		-- harpoon
		{
			"ThePrimeagen/harpoon",
			dependencies = { "nvim-lua/plenary.nvim" },
			event = "VeryLazy"
		},

		{
			'RRethy/vim-illuminate',
			lazy = true,
			enabled = true,
			dependencies = {
				'nvim-lua/plenary.nvim',
			},
			event = { 'CursorMoved', 'InsertLeave' },
			config = function()
				require 'illuminate'.configure {
					filetypes_denylist = {
						'NvimTree',
						'nvim-tree',
						'Telescope',
						'telescope',
					}
				}
			end
		},

		-- lualine
		{
			"nvim-lualine/lualine.nvim",
			event = "VeryLazy",
		},

		-- barbar buffer line
		{
			"romgrk/barbar.nvim",
			init = function() vim.g.barbar_auto_setup = false end,
			opts = {
				auto_hide = true,
				icons = {
					button = '󰅙'
				}
			},
			event = "VeryLazy",
		},

		-- colorscheme
		{
			"catppuccin/nvim",
			event = "VeryLazy",
			name = "catppuccin",
		},

		-- command launcher
		{
			"desdic/greyjoy.nvim",
			dependencies = {
				"stevearc/dressing.nvim",
				event = "VeryLazy",
			},
			event = "VeryLazy"
		},

		-- ft
		-- {
		-- 	"nathom/filetype.nvim",
		-- 	event = "BufReadPre",
		-- 	config = function()
		-- 		require("filetype").setup()
		-- 	end
		-- },

		-- resize on focus
		{
			"beauwilliams/focus.nvim",
			event = "BufReadPost"
		},

		-- toggle boolean
		{
			"nat-418/boole.nvim",
			event = "BufRead",
		},

		-- show git stuff in gutter
		{
			"lewis6991/gitsigns.nvim",
			event = "BufReadPost",
		},

		--  python
		-- {"averms/black-nvim", build: "UpdateRemotePlugins"},

		-- markdown
		{
			"dkarter/bullets.vim",
			event = "VeryLazy",
			ft = "markdown"
		},
		{
			"antonk52/markdowny.nvim",
			config = function()
				require("markdowny").setup()
			end,
			event = "VeryLazy",
			ft = "markdown",
		},
		{
			"kat0h/bufpreview.vim",
			event = "VeryLazy",
			build = "deno task prepare",
			dependencies = { "vim-denops/denops.vim" },
			ft = "markdown",
			cmd = "PreviewMarkdownToggle"
		},
	},
	-- opts/configurations
	{
		ui = { border = "rounded" },
	})
