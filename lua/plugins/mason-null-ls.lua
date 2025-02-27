-- Automatyczna instalacja źródeł dla null-ls w masonie

return {
  "jay-babu/mason-null-ls.nvim",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
  "williamboman/mason.nvim",
  "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      automatic_installation = true
  })
  end
}

