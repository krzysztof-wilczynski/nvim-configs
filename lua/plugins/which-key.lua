return {
  "folke/which-key.nvim",
  lazy = false,
  priority = 100,
  config = function()
    require("plugins.which-key.setup")
  end,
}
