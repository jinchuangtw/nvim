-- Lua:
vim.cmd([[colorscheme dracula]])

local function bgTransparent()
	vim.cmd([[
        highlight Normal guibg=none
        highlight NonText guibg=none
    ]])
end
bgTransparent()
