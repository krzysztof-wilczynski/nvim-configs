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
      ensure_installed = {
        "lua", "rust", "toml", "markdown", "json", "vim", "vimdoc", "yaml", "dockerfile",
        -- Python/Django
        "python", "htmldjango", "html", "css", "javascript", "ninja", "rst",
        -- Vue/Frontend
        "vue", "typescript", "tsx", "scss",
      },
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
