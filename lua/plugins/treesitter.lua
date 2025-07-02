return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "hiphish/rainbow-delimiters.nvim",
  },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua" },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
      auto_install = true,
    })
  end
}
