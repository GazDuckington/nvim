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
	use { "wbthomason/packer.nvim" }

	-- surround word
	use { "tpope/vim-surround", event = "BufEnter" }

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
		requires = 'hrsh7th/nvim-cmp',
	}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		'p00f/nvim-ts-rainbow',
	}
	-- auto tag for html
	use { 'windwp/nvim-ts-autotag', ft = vim.g.web_filetypes }

	-- autoclose brackets and stuff
	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	}

	-- terminal
	use { "akinsho/toggleterm.nvim" }

	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim'
		},
	}
	-- which key
	use { "folke/which-key.nvim" }

	-- colorizer
	use {
		"norcalli/nvim-colorizer.lua",
		config = function()
			require('colorizer').setup()
		end
	}

	-- file explorer
	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		tag = "nightly"
	}

	-- indentation lines
	use { "lukas-reineke/indent-blankline.nvim", event = "BufEnter" }

	-- comment
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
		event = 'BufEnter'
	}

	-- search chars
	use { "ggandor/leap.nvim", event = "BufEnter",
		config = function()
			require('leap').add_default_mappings()
		end
	}

	-- harpoon
	use {
		'ThePrimeagen/harpoon',
		requires = { 'nvim-lua/plenary.nvim' },
		event = 'BufEnter'
	}

	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }

	-- command launcher
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

	-- resize on focus
	use { "beauwilliams/focus.nvim", event = "BufEnter" }

	-- toggle boolean
	use {
		"nat-418/boole.nvim",
		event = "BufEnter",
		config = function()
			require('boole').setup({
				mappings = {
					increment = 't',
					decrement = 'T'
				},
			})
		end
	}

	-- show git stuff in gutter
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = "BufEnter"
	}

	-- markdown
	use { "dkarter/bullets.vim", ft = "markdown" }

	use {
		"kat0h/bufpreview.vim",
		run = "deno task prepare",
		requires = { "vim-denops/denops.vim" },
		ft = "markdown"
	}

	if packer_bootstrap then
		require("packer").sync()
	end
end)
