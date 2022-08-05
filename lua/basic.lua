-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- jkhl 移動時光標周圍保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相對行號
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 顯示左側圖標指示列
vim.wo.signcolumn = "yes"
-- 右側參考線，超過表示代碼太長了，考慮換行
vim.wo.colorcolumn = "80"
-- 縮進4個空格等於一個Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 時移動長度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行對齊當前行
-- vim.o.autoindent = true
-- vim.bo.autoindent = true
vim.o.cindent = true
vim.bo.cindent = true
-- 搜索大小寫不敏感，除非包含大寫
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 邊輸入邊搜索
vim.o.incsearch = true
-- 命令行高為2，提供足夠的顯示空間
vim.o.cmdheight = 2
-- 當文件被外部程序修改時，自動加載
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光標在行首尾時<Left><Right>可以跳到下一行
vim.o.whichwrap = "<,>,[,]"
-- 允許隱藏被修改過的buffer
vim.o.hidden = true
-- 鼠標支持
vim.o.mouse = "a"
-- 禁止創建備份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- 設置 timeoutlen 為等待鍵盤快捷鍵連擊時間500毫秒，可根據需要設置
vim.o.timeoutlen = 500
-- split window 從下邊和右邊出現
vim.o.splitbelow = true
vim.o.splitright = true
-- 自動補全不自動選中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 樣式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可見字符的顯示，這裡只把空格顯示為一個點
vim.o.list = true
vim.o.listchars = "space:·,tab:··"
-- 補全增強
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- 補全最多顯示10行
vim.o.pumheight = 10
-- 永遠顯示 tabline
vim.o.showtabline = 2
-- 使用增強狀態欄插件後不再需要 vim 的模式提示
vim.o.showmode = false
