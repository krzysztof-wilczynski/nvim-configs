return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>Rs", desc = "Wyślij request" },
    { "<leader>Ra", desc = "Wyślij wszystkie requesty" },
    { "<leader>Rb", desc = "Otwórz brudnopis" },
  },
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = true,
  },
}
