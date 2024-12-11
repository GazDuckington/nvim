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
		-- quality of life
		{
			"folke/snacks.nvim",
			priority = 1000,
			lazy = false,
			opts = {
				bigfile = { enabled = true },
				notifier = { enabled = true },
				quickfile = { enabled = true },
				statuscolumn = { enabled = true },
				words = { enabled = true },
				dashboard = { enabled = true },
			}
		},
		{ 'kevinhwang91/nvim-ufo',            dependencies = 'kevinhwang91/promise-async' },
		{
			"levouh/tint.nvim",
		},
		{
			"chrisgrieser/nvim-spider",
		},

		{
			"utilyre/barbecue.nvim",
			name = "barbecue",
			version = "*",
			dependencies = {
				"SmiteshP/nvim-navic",
				"nvim-tree/nvim-web-devicons", -- optional dependency
			},
			opts = {
				-- configurations go here
			},
		},
		{
			"kylechui/nvim-surround",
			version = "*",
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup()
			end
		},
		{
			'Exafunction/codeium.nvim',
			dependencies = {
				"nvim-lua/plenary.nvim",
				"hrsh7th/nvim-cmp",
			}
		},

		-- LSP
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v4.x',
		},
		-- LSP Support
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				{
					"SmiteshP/nvim-navbuddy",
					dependencies = {
						"SmiteshP/nvim-navic",
						"MunifTanjim/nui.nvim"
					},
					opts = {
						lsp = { auto_attach = true }
					}
				}
			},
		},                                     -- Required
		{ "williamboman/mason.nvim" },         -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			event = { "InsertEnter", "CmdlineEnter" },
		},
		{ 'hrsh7th/cmp-nvim-lsp' },   -- Required
		{ 'hrsh7th/cmp-buffer' },     -- Optional
		{ 'hrsh7th/cmp-path' },       -- Optional
		{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
		{ 'hrsh7th/cmp-nvim-lua' },   -- Optional

		-- Snippets
		{ 'L3MON4D3/LuaSnip' },           -- Required
		{ 'rafamadriz/friendly-snippets' }, -- Optional

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
		-- DB
		{
			"kndndrj/nvim-dbee",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"kndndrj/projector-dbee"
			},
			build = function()
				-- Install tries to automatically detect the install method.
				-- if it fails, try calling it with one of these parameters:
				--    "curl", "wget", "bitsadmin", "go"
				require("dbee").install("go")
			end,
			config = function()
				require("dbee").setup(
					{
						outputs = {
							require("projector_dbee").OutputBuilder:new(),
						},
					}
				)
			end,
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

		-- numb
		{
			'nacro90/numb.nvim',
			config = function()
				require('numb').setup()
			end
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
				"debugloop/telescope-undo.nvim",
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make"
				},
				-- "olacin/telescope-cc.nvim"
			},
		},

		-- which key
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			dependencies = {
				"echasnovski/mini.icons",
				"nvim-tree/nvim-web-devicons",
			},
			opts = {},
			keys = {
				{
					"<leader>?",
					function()
						require("which-key").show({ global = false })
					end,
					desc = "Buffer Local Keymaps (which-key)",
				},
			}
		},

		-- colorizer
		{
			"norcalli/nvim-colorizer.lua",
			event = "VeryLazy",
		},

		-- file explorer
		{
			"nvim-tree/nvim-tree.lua",
			event = "VeryLazy",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},

		-- indentation lines
		{ 'echasnovski/mini.indentscope', version = '*' },

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
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {}
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
			dependencies = {
				'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
				'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
			},
			opts = {
				auto_hide = true,
				icons = {
					button = '󰅙'
				}
			},
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

		-- toggle boolean
		{
			"nat-418/boole.nvim",
			event = "BufRead",
			config = function()
				require("boole").setup({
					mappings = {
						increment = '<A-a>',
						decrement = '<A-x>',
					}
				})
			end
		},

		-- show git stuff in gutter
		{
			"lewis6991/gitsigns.nvim",
			event = "BufReadPost",
		},

		--  python
		{
			"linux-cultist/venv-selector.nvim",
			branch = "regexp",
			dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
			config = true,
			event = "VeryLazy",
		},
		-- {"averms/black-nvim", build: "UpdateRemotePlugins"},
		-- markdown
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			build = "cd app && npm install",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		},
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
	},
	-- opts/configurations
	{
		ui = { border = "rounded" },
	})
