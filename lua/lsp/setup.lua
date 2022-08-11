local lsp_installer = require("nvim-lsp-installer")

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
for name, _ in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

lsp_installer.on_server_ready(function(server)
	local config = servers[server.name]
	if config == nil then
		return
	end
	if config.on_setup then
		config.on_setup(server)
	else
		server:setup({})
	end
end)
