return {
  "s1n7ax/nvim-window-picker",
  version = "2.*",
  event = "VeryLazy",
  opts = {
    hint = "floating-big-letter",
    filter_rules = {
      include_current_win = false,
      autoselect_one = true,
      bo = {
        filetype = { "neo-tree", "neo-tree-popup", "notify", "noice" },
        buftype = { "terminal", "quickfix" },
      },
    },
  },
}
