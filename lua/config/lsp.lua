local autocmd = vim.api.nvim_create_autocmd
local keymaps = require("config.keymaps")

vim.diagnostic.config({
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = true, -- Show source in diagnostic popup window
    header = "",
    prefix = "",
  },
  virtual_text = false,
  virtual_lines = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

autocmd("LspAttach", {
  callback = keymaps.get_lsp_bindigs,
})
