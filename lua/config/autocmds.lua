local autocmd = vim.api.nvim_create_autocmd
local keymaps = require("config.keymaps")

autocmd("LspAttach", {
  callback = keymaps.get_lsp_bindigs,
})
