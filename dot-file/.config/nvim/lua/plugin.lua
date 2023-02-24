-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'

	use { -- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',

			-- Additional lua configuration, makes nvim stuff amazing
			'folke/neodev.nvim',
		},
	}
	require('neodev').setup()
	require('fidget').setup()

	use { -- Autocompletion
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-path',
			-- 'dcampos/cmp-emmet-vim',
			-- 'onsails/lspkind.nvim'
		},
	}
	require('plugins.luasnip')

	use { -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	}

	use { -- Additional text objects via treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}
	require('plugins.treesitter')

	-- Git related plugins
	use 'tpope/vim-fugitive'

	use 'tpope/vim-rhubarb'

	use 'lewis6991/gitsigns.nvim'
	require('plugins.gitsigns')

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	require('plugins.lualine')

	-- gcc from a line comment, gbc from a block comment
	use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
	require('Comment').setup()

	-- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
	require('plugins.telescope')

	use { "catppuccin/nvim", as = "catppuccin" }
	require('plugins.catppuccin')


	-- snippets
	use { 'rafamadriz/friendly-snippets' }
	use { 'hrsh7th/vim-vsnip' }
	use { 'honza/vim-snippets' }
	use { 'mattn/emmet-vim' }

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}
	require('plugins.nvimTree')

	use { 'junegunn/vim-easy-align' }
	require('plugins.vimEasyAlign')

	use { 'ap/vim-css-color' }

	use { 'mbbill/undotree' }

	use { 'fatih/vim-go' }

	use { 'simrat39/symbols-outline.nvim' }
	require("symbols-outline").setup()

	use { 'echasnovski/mini.nvim', branch = 'stable' }
	require('plugins.mini')

	use { 'uga-rosa/ccc.nvim' }
	require('ccc').setup()

	-- use {
	-- 	"rest-nvim/rest.nvim",
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("rest-nvim").setup({
	-- 			-- Open request results in a horizontal split
	-- 			result_split_horizontal = false,
	-- 			-- Keep the http file buffer above|left when split horizontal|vertical
	-- 			result_split_in_place = false,
	-- 			-- Skip SSL verification, useful for unknown certificates
	-- 			skip_ssl_verification = false,
	-- 			-- Encode URL before making request
	-- 			encode_url = true,
	-- 			-- Highlight request on run
	-- 			highlight = {
	-- 				enabled = true,
	-- 				timeout = 150,
	-- 			},
	-- 			result = {
	-- 				-- toggle showing URL, HTTP info, headers at top the of result window
	-- 				show_url = true,
	-- 				show_http_info = true,
	-- 				show_headers = true,
	-- 				-- executables or functions for formatting response body [optional]
	-- 				-- set them to false if you want to disable them
	-- 				formatters = {
	-- 					json = "jq",
	-- 					html = function(body)
	-- 						return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
	-- 					end
	-- 				},
	-- 			},
	-- 			-- Jump to request line on run
	-- 			jump_to_request = false,
	-- 			env_file = '.env',
	-- 			custom_dynamic_variables = {},
	-- 			yank_dry_run = true,
	-- 		})
	-- 	end
	-- }

	use { 'ianding1/leetcode.vim' }
	require('plugins.leetcode')

	use { 'jamestthompson3/nvim-remote-containers' }

	use { 'preservim/vim-markdown' }
	require('plugins.markdown')

	-- use { 'atusy/tsnode-marker.nvim' }
	-- require('plugins.tsnodeMarker')

	-- use { '~/git/nvimPlugin' }

	-- use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
	-- require('plugins.barbar')

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	-- local has_plugins, plugins = pcall(require, 'custom.plugins')
	-- if has_plugins then
	--   plugins(use)
	-- end
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})

require('plugins.lspAndCmp')
