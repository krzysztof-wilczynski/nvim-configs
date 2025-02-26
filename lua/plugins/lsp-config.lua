-- LSP - language server protocol, komunikacja pomiędzy serwerem języka a IDE
--
-- mason - interfejs do zarządzania serwerami LSP, DAP, linterami i formaterami

-- :h vim.lsp.buf

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup(
        {
          ensure_installed = {
            "lua_ls", "ts_ls"
          }})
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      vim.keymap.set('n', '<C-q>', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<C-b>', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

