local packer = require("packer")
packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-------------------------- plugins -------------------------------------------
		-- colorscheme
		use("Mofiqul/dracula.nvim")
		-- nvim-tree
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- bufferline
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- telescope extensions
		-- use "LinArcX/telescope-env.nvim"
		-- Auto-closing
		use("jiangmiao/auto-pairs")
		-- dashboard-nvim
		use("glepnir/dashboard-nvim")
		-- project
		use("ahmedkhalf/project.nvim")
		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter" })
		-- discord presence
		use("andweeb/presence.nvim")
		--------------------- LSP --------------------
		use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		-- 補全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 補全來源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

		-- 常見程式語言補全用
		use("rafamadriz/friendly-snippets")
		-- ui
		use("onsails/lspkind-nvim")
		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		-- code formatting
		use("mhartington/formatter.nvim")
		-- Markdown previewer
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})
		-- vimtex
		use("lervag/vimtex")
		-- use("neoclide/coc.nvim")
		-- snippets
		use("Sirver/ultisnips")
		use("honza/vim-snippets")
		-- git blame
		use("zivyangll/git-blame.vim")
	end,
	config = {
		git = {
			default_url_foramt = "https://github.com/%s",
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

-- 每次保存 plugins.lua 自動安裝插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
