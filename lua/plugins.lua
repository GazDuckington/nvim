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
		{ 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
		{
			'mikesmithgh/kitty-scrollback.nvim',
			dependencies = {
				"ibhagwan/fzf-lua",
				-- optional for icon support
				dependencies = { "nvim-tree/nvim-web-devicons" },
				config = function()
					-- calling `setup` is optional for customization
					require("fzf-lua").setup({})
				end
			},
			enabled = true,
			lazy = true,
			cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
			event = { 'User KittyScrollbackLaunch' },
			-- version = '*', -- latest stable version, may have breaking changes if major version changed
			-- version = '^4.0.0', -- pin major version, include fixes and features that do not have breaking changes
			config = function()
				require('kitty-scrollback').setup()
			end,
		},
		{
			'mvllow/modes.nvim',
			tag = 'v0.2.0',
			config = function()
				require('modes').setup()
			end
		},
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
		-- {
		-- 	"github/copilot.vim",
		-- },
		{
			'Exafunction/codeium.nvim',
			dependencies = {
				"nvim-lua/plenary.nvim",
				{
					"hrsh7th/nvim-cmp",
					event = { "InsertEnter", "CmdlineEnter" },
				},
			},
		},

		-- LSP
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v1.x',
			dependencies = {
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
							opts = { lsp = { auto_attach = true } }
						}
					},
				},                                   -- Required
				{ "williamboman/mason.nvim" },       -- Optional
				{ "williamboman/mason-lspconfig.nvim" }, -- Optional
				-- Autocompletion
				{
					"hrsh7th/nvim-cmp",
					event = { "InsertEnter", "CmdlineEnter" },
				},
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
		-- {
		-- 	'VonHeikemen/fine-cmdline.nvim',
		-- 	dependencies = {
		-- 		{ 'MunifTanjim/nui.nvim' }
		-- 	}
		-- },
		-- tabnine
		-- {
		-- 	"tzachar/cmp-tabnine",
		-- 	build = "./install.sh",
		-- 	event = "InsertEnter",
		-- },
		-- {
		-- 	"jackMort/ChatGPT.nvim",
		-- 	event = "VeryLazy",
		-- 	config = function()
		-- 		local home = vim.fn.expand("$HOME")
		-- 		require("chatgpt").setup({
		-- 			api_key_cmd = "cat " .. home .. "/secret.txt"
		-- 		})
		-- 	end,
		-- 	dependencies = {
		-- 		"MunifTanjim/nui.nvim",
		-- 		"nvim-lua/plenary.nvim",
		-- 		"folke/trouble.nvim",
		-- 		"nvim-telescope/telescope.nvim"
		-- 	}
		-- },
		-- {
		-- 	"codota/tabnine-nvim",
		-- 	build = "./dl_binaries.sh",
		-- 	event = "VeryLazy",
		-- 	config = function()
		-- 		require("tabnine").setup({
		-- 			disable_auto_comment = true,
		-- 			accept_keymap = "<C-space>",
		-- 			dismiss_keymap = "<C-]>",
		-- 			debounce_ms = 800,
		-- 			suggestion_color = { gui = "#808080", cterm = 244 },
		-- 			exclude_filetypes = { "TelescopePrompt" }
		-- 		})
		-- 	end
		-- },

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

		-- lazygit
		{
			"kdheepak/lazygit.nvim",
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
			-- optional for floating window border decoration
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
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
			opts = {
				keys = {
					{
						"<leader>?",
						function()
							require("which-key").show({ global = false })
						end,
						desc = "Buffer Local Keymaps (which-key)",
					},
				}
			}
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
			-- tag = "nightly",
		},

		-- indentation lines
		-- {
		-- 	"lukas-reineke/indent-blankline.nvim",
		-- 	event = "BufReadPre"
		-- },
		{
			"shellRaining/hlchunk.nvim",
			event = { "UIEnter" },
			config = function()
				require("hlchunk").setup({
					indent = {
						chars = {
							"│",
						},
						-- style = {
						-- 	"#f38ba8",
						-- 	"#fab387",
						-- 	"#f9e2af",
						-- 	"#a6e3a1",
						-- 	"#89dceb",
						-- 	"#89b4fa",
						-- 	"#cba6f7",
						-- },
					},
					line_num = {
						style = "#cba6f7",
					},
					chunk = {
						chars = {
							horizontal_line = "─",
							vertical_line = "│",
							left_top = "┌",
							left_bottom = "└",
							right_arrow = "─",
						},
						style = "#cba6f7"
					}
				})
			end
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
		-- 	event = "BufReadPost",
		-- 	opts = function()
		-- 		require("filetype").resolve()
		-- 	end,
		-- 	config = function()
		-- 		require("filetype").setup()
		-- 	end
		-- },

		-- resize on focus
		-- {
		-- 	"nvim-focus/focus.nvim",
		-- 	version = false,
		-- 	event = "BufReadPost",
		-- },

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

		-- session manager
		{
			"gennaro-tedesco/nvim-possession",
			dependencies = {
				"ibhagwan/fzf-lua",
			},
			config = true,
			-- init = function()
			-- 	local possession = require("nvim-possession")
			-- 	vim.keymap.set("n", "<leader>sl", function()
			-- 		possession.list()
			-- 	end)
			-- 	vim.keymap.set("n", "<leader>sn", function()
			-- 		possession.new()
			-- 	end)
			-- 	vim.keymap.set("n", "<leader>su", function()
			-- 		possession.update()
			-- 	end)
			-- 	vim.keymap.set("n", "<leader>sd", function()
			-- 		possession.delete()
			-- 	end)
			-- end,
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
