return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      renderer = {
        root_folder_label = false,
      },
    })
    local normal_hl = vim.api.nvim_get_hl(0, { name = "NvimTreeNormal" })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {
      fg = normal_hl.bg,
      bg = normal_hl.bg,
    })
  end,
}
