return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",  -- stabilna wersja (nie main!)
  dependencies = {
    "hiphish/rainbow-delimiters.nvim",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "rust", "toml", "markdown", "json", "vim", "vimdoc", "yaml", "dockerfile" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
        },
      },
    })
  end,
}
