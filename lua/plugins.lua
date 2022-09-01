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

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use "lukas-reineke/lsp-format.nvim"

  -- autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    'p00f/nvim-ts-rainbow',

    -- auto tag for html
    'windwp/nvim-ts-autotag',
    'windwp/nvim-autopairs',
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
    requires = {'kyazdani42/nvim-web-devicons'}
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
