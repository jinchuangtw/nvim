-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local opts = {
	cmd = {
		"jedi-language-server",
	},
	filetypes = {
		"python",
	},
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = function(client, bufnr)
		-- 禁用格式化功能，交給專門插件插件處理
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		-- 綁定快捷鍵
		require("keybindings").mapLSP(buf_set_keymap)
		-- 保存時自動格式化
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end,
}

-- 查看目錄等信息
return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
