return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      yaml = { "prettier" },
      python = { "ruff_format" },
      htmldjango = { "djlint" },
      -- Vue/Frontend
      vue = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
    },
    -- Automatyczne formatowanie na zapis (z wykluczeniem niektórych filetype)
    format_on_save = function(bufnr)
      local ignore_filetypes = { "markdown", "text" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return false
      end
      return { lsp_fallback = true }
    end,
    -- Jeśli nie ma dedykowanego formatera, użyj LSP
    lsp_fallback = true,
    async = false,
    notify_on_error = true,
  },
}
