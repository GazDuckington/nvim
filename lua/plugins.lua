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
-- plugins
	{
		-- surround word
		{ "tpope/vim-surround", event = "BufEnter" },

		-- LSP
		{
			"VonHeikemen/lsp-zero.nvim",
			dependencies = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },
				-- Autocompletion
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },
				-- Snippets
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
			event = "BufEnter",
		},

		-- tabnine
		{
			"tzachar/cmp-tabnine",
			build = "./install.sh",
			dependencies = "hrsh7th/nvim-cmp",
			event = "BufEnter",
		},

		-- Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			"p00f/nvim-ts-rainbow",
			event = "BufEnter",
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
		{ "akinsho/toggleterm.nvim" },

		-- telescope
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		-- telescope extensions
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- which key
		{ "folke/which-key.nvim" },

		-- colorizer
		{
			"norcalli/nvim-colorizer.lua",
			config = true,
		},

		-- file explorer
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			tag = "nightly",
			event = "BufEnter"
		},

		-- indentation lines
		{ "lukas-reineke/indent-blankline.nvim", event = "BufEnter" },

		-- comment
		{
			"numToStr/Comment.nvim",
			config = true,
			event = "BufEnter"
		},

		-- search chars
		{ "ggandor/leap.nvim", event = "BufEnter",
			config = function()
				require("leap").add_default_mappings()
			end
		},

		-- harpoon
		{
			"ThePrimeagen/harpoon",
			dependencies = { "nvim-lua/plenary.nvim" },
			event = "BufEnter"
		},

		-- lualine
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" }
		},

		-- colorscheme
		{
			"catppuccin/nvim",
			name = "catppuccin",
			lazy = true,
		},

		-- command launcher
		{
			"desdic/greyjoy.nvim",
			dependencies = { "stevearc/dressing.nvim",
				config = true,
				event = "VeryLazy",
			},
		},

		-- ft
		{ "nathom/filetype.nvim" },

		-- resize on focus
		{ "beauwilliams/focus.nvim", event = "BufEnter" },

		-- toggle boolean
		{
			"nat-418/boole.nvim",
			event = "BufEnter",
		},

		-- smooth scrolling
		{
			"karb94/neoscroll.nvim",
			event = "BufEnter",
		},

		-- show git stuff in gutter
		{
			"lewis6991/gitsigns.nvim",
			config = true,
			event = "BufEnter",
		},

		-- markdown
		{ "dkarter/bullets.vim", ft = "markdown" },

		{
			"kat0h/bufpreview.vim",
			build = "deno task prepare",
			dependencies = { "vim-denops/denops.vim" },
			ft = "markdown",
		},
	},
	-- opts/configurations
	{
		ui = { border = "rounded" },
	})
