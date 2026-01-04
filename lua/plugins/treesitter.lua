return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "hiphish/rainbow-delimiters.nvim",
  },
  build = ":TSUpdate",
  lazy = false,
  config = function()
    -- Instaluj parsery
    require("nvim-treesitter").install({ "lua", "rust", "toml", "markdown", "json" })

    -- Włącz highlighting dla wszystkich obsługiwanych języków
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
