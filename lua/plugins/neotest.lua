return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        vim.cmd("Trouble quickfix")
      end,
    },
  },
}
