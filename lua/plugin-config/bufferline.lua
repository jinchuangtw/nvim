local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("沒有找到 bufferline")
  return
end

-- bufferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
  options = {
    -- 關閉 Tab 的命令，這裡使用 moll/vim-bbye 的 :Bdelete 命令
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    -- 側邊欄配置
    -- 左側讓出 nvim-tree 的位置，顯示文字 File Explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- 使用 nvim 內置 LSP  後續課程會配置
    diagnostics = "nvim_lsp",
    -- 可選，顯示 LSP 報錯圖標
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
})
