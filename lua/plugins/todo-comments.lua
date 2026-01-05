return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      TODO = { icon = " ", color = "info" },
      FIXME = { icon = " ", color = "error", alt = { "FIX", "BUG" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*:]],
    },
  },
}
