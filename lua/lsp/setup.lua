-- :h mason-default-settings
-- ~/.local/share/nvim/mason
require("mason").setup({
	ui = {
	  icons = {
		package_installed = "✓",
		package_pending = "➜",
		package_uninstalled = "✗",
	  },
	},
  })
  
  -- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
  -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
  require("mason-lspconfig").setup({
	ensure_installed = {
	  "clangd",
	  "cmake",
	  "jedi_language_server",
	  "ltex",
	  "prosemd_lsp",
	  "pylsp",
	  "quick_lint_js",
	  "sumneko_lua",
	  "texlab"
	},
  })
  
  local lspconfig = require("lspconfig")
  
-- 安裝列表
-- { key: 語言 value: 配置文件 }
-- key 必須為下列網址列出的名稱
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
	clangd = require("lsp.config.clangd"), -- lua/lsp/config/clangd.lua
	-- ltex = require("lsp.config.ltex"), -- lua/lsp/config/ltex.lua
	texlab = require("lsp.config.texlab"), -- lua/lsp/config/texlab.lua
	jedi_language_server = require("lsp.config.jedi_language_server"),
}
-- 自動安裝 Language Servers
for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
	  config.on_setup(lspconfig[name])
	else
	  lspconfig[name].setup({})
	end
  end
  