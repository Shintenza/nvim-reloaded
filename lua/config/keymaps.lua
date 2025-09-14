local opts = { noremap = false, silent = true }

function keymap(mode, keys, action, description)
  local binding_options = {}
  for k, v in pairs(opts) do
    binding_options[k] = v
  end
  if description ~= nil then
    binding_options["desc"] = description
  end
  vim.keymap.set(mode, keys, action, binding_options)
end

keymap("n", "<leader>[", "<cmd>BufferLineCyclePrev<CR>", "Next buffer")
keymap("n", "<leader>]", "<cmd>BufferLineCycleNext<CR>", "Prev buffer")

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", "Toggle file explorer")
keymap("n", "<leader>z", ":ToggleTerm<CR>", "Toggle terminal")

local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, "Telescope find files")
keymap("n", "<leader>fg", builtin.live_grep, "Telescope live grep")
keymap("n", "<leader>fb", builtin.buffers, "Telescope buffers")
keymap("n", "<leader>fh", builtin.help_tags, "Telescope help tags")

keymap("t", "<esc>", [[<C-\><C-n>]])

local M = {}

function M.get_lsp_bindigs(event)
  local bufmap = function(mode, rhs, lhs)
    vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
  end

  -- Standard lsp mappings
  bufmap("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>")
  bufmap("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  bufmap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  bufmap("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
  bufmap({ "i", "s" }, "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

  bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  bufmap("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
  bufmap("n", "grd", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  bufmap({ "n", "x" }, "gq", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")

  -- Lspsaga
  bufmap("n", "grn", "<cmd>Lspsaga rename<cr>")
  bufmap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
  bufmap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
  bufmap("n", "K", "<cmd>Lspsaga hover_doc<cr>")
end

return M
