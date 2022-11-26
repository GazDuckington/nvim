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
		'windwp/nvim-autopairs',
	}

	-- terminal
	use {
		"akinsho/toggleterm.nvim",
		tag = 'v2.*',
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
		"folke/zen-mode.nvim",
		"folke/twilight.nvim",
		"folke/trouble.nvim",
	}
	-- impatient
	use 'lewis6991/impatient.nvim'

	-- colorizer
	use 'norcalli/nvim-colorizer.lua'

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly'
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

	use {
		"desdic/greyjoy.nvim",
		requires = { "stevearc/dressing.nvim" }
	}

	use {
		'ACupofAir/nvim-repl',
		requires = { 'tpope/vim-repeat' }
	}
	-- ft
	use { "nathom/filetype.nvim" }

	-- repl

	-- dap debugger
	-- use {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	requires = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"mfussenegger/nvim-dap-python"
	-- 	}
	-- }

	if packer_bootstrap then
		require("packer").sync()
	end
end)
