-- Podświetlanie składni
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",

    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,

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
