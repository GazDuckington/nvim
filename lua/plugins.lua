-- bootstrapping
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path
		})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end
	}
})

-- install plugins here
packer.startup(function(use)
	use "wbthomason/packer.nvim"
	use "tpope/vim-surround"

	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"onsails/lspkind.nvim",
	}
	-- Trouble
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				use_diagnostic_signs = false
			}
		end
	}

	-- autocompletion
	use {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
	}

	-- tabnine
	use {
		'tzachar/cmp-tabnine',
		run = './install.sh',
		requires = 'hrsh7th/nvim-cmp'
	}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		'p00f/nvim-ts-rainbow',

		-- auto tag for html
		'windwp/nvim-ts-autotag',
		'windwp/nvim-autopairs',
	}
	use { 'Djancyp/better-comments.nvim' }

	-- terminal
	use {
		"akinsho/toggleterm.nvim",
		tag = 'v2.*',
		config = function()
			require("toggleterm").setup()
		end
	}

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- which key
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				plugins = {
					spelling = { enabled = true }
				},
				window = {
					border = "single"
				},
				layout = {
					height = { min = 4 },
					width = { max = 10 },
					spacing = 5,
				}
			})
		end
	}
	-- impatient
	use 'lewis6991/impatient.nvim'

	-- colorizer
	use {
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}

	-- indentation lines
	use "lukas-reineke/indent-blankline.nvim"

	-- comment
	use "terrortylor/nvim-comment"
	use "ggandor/leap.nvim"

	-- tabline
	use {
		'romgrk/barbar.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}

	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }

	use("stevearc/dressing.nvim")

	use({ "desdic/greyjoy.nvim",
		config = function()
			local greyjoy = require("greyjoy")
			greyjoy.setup({
				output_results = "toggleterm",
				last_first = true,
				extensions = {
					generic = {
						commands = {
							["run test.py"] = {
								command = { "./test.py" },
								filetype = "python"
							},
							["run {filename}"] = {
								command = { "go", "run", "{filename}" },
								filetype = "go"
							}
						}
					},
					kitchen = {
						targets = { "converge", "verify" },
						include_all = false,
					}
				},
				run_groups = {
					fast = { "generic", "makefile", "cargo" },
				}
			})
			greyjoy.load_extension("generic")
			greyjoy.load_extension("vscode_tasks")
			greyjoy.load_extension("makefile")
			greyjoy.load_extension("kitchen")
			greyjoy.load_extension("cargo")
		end
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
