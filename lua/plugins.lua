local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float({ border = 'single' })
		end,
	},
}

-- install plugins here
packer.startup(function(use)

	use "ellisonleao/glow.nvim"
	use "tpope/vim-surround"

	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	-- go support
	use {
		'ray-x/go.nvim',
		'ray-x/guihua.lua',
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
					height = { min = 5 },
					width = { min = 10 },
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

	-- indentation lines
	use "lukas-reineke/indent-blankline.nvim"

	-- comment
	use "terrortylor/nvim-comment"

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

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
