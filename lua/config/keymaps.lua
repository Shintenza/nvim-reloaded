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

keymap("n", "<A-x>", ":bd!<CR>", "Close buffer")
keymap("n", "<A-[>", "<cmd>BufferLineCyclePrev<CR>", "Next buffer")
keymap("n", "<A-]>", "<cmd>BufferLineCycleNext<CR>", "Prev buffer")

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", "Toggle file explorer")
keymap("n", "<leader>t", ":ToggleTerm<CR>", "Toggle terminal")

local telescope = require("telescope.builtin")
keymap("n", "<leader>ff", telescope.find_files, "Telescope find files")
keymap("n", "<leader>fg", telescope.live_grep, "Telescope live grep")
keymap("n", "<leader>fb", telescope.buffers, "Telescope buffers")
keymap("n", "<leader>fh", telescope.help_tags, "Telescope help tags")

keymap("t", "<esc>", [[<C-\><C-n>]])

local M = {}

function M.get_lsp_bindigs(event)
	local bufmap = function(mode, rhs, lhs)
		vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
	end

	-- Standard lsp mappings
	bufmap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	bufmap("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
	bufmap({ "i", "s" }, "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

	bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
	bufmap("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
	bufmap("n", "grd", "<cmd>lua vim.lsp.buf.declaration()<cr>")
	bufmap({ "n", "x" }, "gq", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")

	-- Lspsaga
	bufmap("n", "grr", "<cmd>Lspsaga finder ref<cr>")
	bufmap("n", "gri", "<cmd>Lspsaga finder imp<cr>")
	bufmap("n", "grn", "<cmd>Lspsaga rename<cr>")
	bufmap("n", "gra", "<cmd>Lspsaga code_action<cr>")
	bufmap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
	bufmap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
	bufmap("n", "K", "<cmd>Lspsaga hover_doc<cr>")
end

return M
