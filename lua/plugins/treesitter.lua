return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "hiphish/rainbow-delimiters.nvim",
  },
  build = ":TSUpdate",
  lazy = false,
  config = function()
    -- Auto-instalacja parserów (wymaga tree-sitter-cli)
    require("nvim-treesitter").setup({
      ensure_installed = { "lua", "rust", "toml", "markdown", "json", "vim", "vimdoc" },
      auto_install = true,
    })
  end,
}
