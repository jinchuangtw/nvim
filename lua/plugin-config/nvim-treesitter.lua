local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("沒有找到 nvim-treesitter")
    return
end

treesitter.setup({
  -- 安裝 language parser
  -- :TSInstallInfo 命令查看支持的語言
  ensure_installed = { "c", "cpp", "json", "html", "css", "vim", "lua", "javascript", "python" },
  -- 啓用代碼高亮模塊
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 啓用增量選擇模塊
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
      },
  },
  -- 啟用代碼縮進模塊 (=)
  indent = {
    enable = true,
  },
})

-- 開啓 Folding 模塊
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默認不要折疊
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
