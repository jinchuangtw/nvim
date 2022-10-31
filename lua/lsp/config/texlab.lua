-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local common = require("lsp.common-config")

local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = function(client, bufnr)
		common.disableFormat(client)
		common.keyAttach(bufnr)
	end,
	cmd = {
		"texlab",
	},
	filetypes = {
		"tex",
		"plaintex",
		"bib",
	},
}

-- 查看目錄等信息
return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
