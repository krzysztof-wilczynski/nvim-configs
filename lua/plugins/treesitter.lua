-- Podświetlanie składni
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPre",

    main = "nvim-treesitter.configs",

opts = {
      highlight = {enable = true},
      indent = {enable = true},
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "css",
        "csv",
        "dockerfile",
        "graphql",
        "html",
        "http",
        "javascript",
        "prisma",
        "regex",
        "sql",
        "typescript",
        "vue",
        "yaml",
        "json",
        "python",
        "toml",
        "markdown",
        "markdown_inline",
      },
      auto_install = true,
    },

    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
    },
  },
  {
    -- Use treesitter to autoclose and autorename html tag
    "windwp/nvim-ts-autotag",
    event = "BufReadPre",
  },
}
