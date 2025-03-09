return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>rs", desc = "Wyślij request" },
    { "<leader>ra", desc = "Wyślij wszystkie requesty" },
    { "<leader>rb", desc = "Otwórz brudnopis" },
  },
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = false,
  },
}
