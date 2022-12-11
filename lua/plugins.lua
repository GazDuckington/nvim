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
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
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
	}
	use { 'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end
	}

	use {
		"utilyre/barbecue.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"smiteshp/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		tag = 'dev'
	}

	-- terminal
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
	}

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	-- which key
	use {
		"folke/which-key.nvim",
		"folke/zen-mode.nvim",
		"folke/twilight.nvim",
	}
	-- impatient
	use 'lewis6991/impatient.nvim'
	use 'tweekmonster/startuptime.vim'

	-- colorizer
	use { 'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
		tag = 'nightly'
	}

	-- indentation lines
	use 'lukas-reineke/indent-blankline.nvim'

	-- comment
	use { 'terrortylor/nvim-comment',
		config = function()
			require('nvim_comment').setup()
		end
	}
	use { 'ggandor/leap.nvim',
		config = function()
			require('leap').add_default_mappings()
		end
	}

	-- harpoon
	use {
		'ThePrimeagen/harpoon',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	-- barbar line
	use {
		'romgrk/barbar.nvim',
		requires = 'nvim-tree/nvim-web-devicons',
	}

	-- colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }

	use {
		'desdic/greyjoy.nvim',
		requires = { 'stevearc/dressing.nvim',
			config = function()
				require('dressing').setup()
			end
		}
	}

	-- ft
	use { "nathom/filetype.nvim" }

	-- session mgmt
	use {
		'jedrzejboczar/possession.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('possession').setup()
		end
	}
	-- resize on focus
	use {
		"beauwilliams/focus.nvim",
	}

	if packer_bootstrap then
		require("packer").sync()
	end
end)
