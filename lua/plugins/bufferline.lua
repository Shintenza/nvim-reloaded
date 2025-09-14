local function int_to_hex(n)
  if not n then
    return nil
  end
  return string.format("#%06x", n)
end

return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = function()
    local hl_separator_fg = vim.api.nvim_get_hl(0, { name = "NvimTreeWinSeparator", link = false }).fg
    local hl_normal_bg = vim.api.nvim_get_hl(0, { name = "NvimTreeWinSeparator", link = false }).bg

    return {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "",
            padding = 0,
            highlight = "NvimTreeNormal",
            separator = "│",
          },
        },
        show_buffer_close_icons = true,
        sort_by = "insert_after_current",
      },
      highlights = {
        offset_separator = {
          fg = int_to_hex(hl_separator_fg),
          bg = int_to_hex(hl_normal_bg),
        },
      },
    }
  end,
}
