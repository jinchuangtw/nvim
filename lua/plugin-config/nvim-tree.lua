local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("Not found: nvim-tree")
  return
end

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("沒有找到 nvim-tree")
  return
end

-- 列表操作快捷鍵
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    -- 不顯示 git 狀態圖標
    git = {
        enable = false,
    },
    -- project plugin 需要這樣設置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隱藏 .文件 和 node_modules 文件夾
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 寬度
        width = 40,
        -- 也可以 'right'
        side = 'left',
        -- 隱藏根目錄
        hide_root_folder = false,
        -- 自定義列表中快捷鍵
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        -- 不顯示行數
        number = false,
        relativenumber = false,
        -- 顯示圖標
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打開大小適配
            resize_window = true,
            -- 打開文件時關閉
            quit_on_open = true,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'open', -- mac 直接設置為 open
    },
})
-- 自動關閉
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

