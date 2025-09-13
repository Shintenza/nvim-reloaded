return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      offsets = {
        { filetype = "NvimTree", text = "", padding = 1 },
      },
      separator_style = "thick",
      show_buffer_close_icons = false,
      sort_by = "insert_after_current",
    },
  },
}
