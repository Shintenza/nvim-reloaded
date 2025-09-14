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

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", "Toggle file explorer")
keymap("n", "<leader>z", ":ToggleTerm<CR>", "Toggle terminal")

local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, "Telescope find files")
keymap("n", "<leader>fg", builtin.live_grep, "Telescope live grep")
keymap("n", "<leader>fb", builtin.buffers, "Telescope buffers")
keymap("n", "<leader>fh", builtin.help_tags, "Telescope help tags")

keymap("t", "<esc>", [[<C-\><C-n>]])
