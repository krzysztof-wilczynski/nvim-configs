return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "md" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  opts = {
    heading = {
      enabled = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    code = {
      enabled = true,
      style = "full",
      border = "thin",
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱 " },
      checked = { icon = "󰄵 " },
    },
    quote = {
      enabled = true,
      icon = "▎",
    },
    pipe_table = {
      enabled = true,
      style = "full",
    },
    link = {
      enabled = true,
      hyperlink = "󰌷 ",
      image = "󰥶 ",
    },
  },
}
