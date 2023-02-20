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
				-- surround word
				{
						"tpope/vim-surround",
						event = "InsertEnter"
				},

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
								-- Null
								{ "jose-elias-alvarez/null-ls.nvim" },
						},
						event = "InsertEnter",
				},

				-- tabnine
				{
						"tzachar/cmp-tabnine",
						build = "./install.sh",
						dependencies = "hrsh7th/nvim-cmp",
						event = "InsertEnter",
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
						dependencies = {
								"nvim-lua/plenary.nvim",
								{
										"nvim-telescope/telescope-fzf-native.nvim",
										build = "make"
								},
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
						config = function()
							require("colorizer").setup()
						end,
				},

				-- file explorer
				{
						"nvim-tree/nvim-tree.lua",
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

				-- search chars
				{
						"ggandor/leap.nvim",
						event = "BufRead",
						config = function()
							require("leap").add_default_mappings()
						end
				},

				-- harpoon
				{
						"ThePrimeagen/harpoon",
						dependencies = { "nvim-lua/plenary.nvim" },
						event = "VeryLazy"
				},

				-- session manager

				-- lualine
				{
						"nvim-lualine/lualine.nvim",
						dependencies = { "nvim-tree/nvim-web-devicons" },
						event = "VeryLazy",
				},

				-- barbar buffer line
				{
						"romgrk/barbar.nvim",
						requires = { "nvim-tree/nvim-web-devicons" },
						config = function()
							require("bufferline").setup { auto_hide = true, }
						end,
						event = "VeryLazy",
				},

				-- colorscheme
				{
						"catppuccin/nvim",
						name = "catppuccin",
						lazy = false,
				},

				-- command launcher
				{
						"desdic/greyjoy.nvim",
						dependencies = { "stevearc/dressing.nvim",
								config = true,
								event = "VeryLazy",
						},
						event = "VeryLazy"
				},

				-- ft
				{
						"nathom/filetype.nvim",
						event = "BufReadPre"
				},

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
						config = true,
						event = "BufReadPost",
				},

				-- markdown
				{
						"dkarter/bullets.vim",
						ft = "markdown"
				},
				{
						"antonk52/markdowny.nvim",
						config = function()
							require("markdowny").setup()
						end,
						ft = "markdown",
				},
				{
						"kat0h/bufpreview.vim",
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
