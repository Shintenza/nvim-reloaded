local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
  "williamboman/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    {
      "nvimtools/none-ls.nvim",
      opts = {
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      },
    },
    {
      "jay-babu/mason-null-ls.nvim",
      dependencies = { "mason-org/mason.nvim", "nvimtools/none-ls.nvim" },
      opts = {
        ensure_installed = { "stylua", "prettierd" },
        automatic_installation = true,
        handlers = {},
      },
    },
  },
}
