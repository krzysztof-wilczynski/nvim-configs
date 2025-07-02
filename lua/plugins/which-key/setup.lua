local present, wk = pcall(require, "which-key")
if not present then
  return
end

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
  },
  preset = "helix",
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  win = {
    border = "rounded",
    padding = { 1, 1, 1, 1 },
  },
  show_help = true,
})

local quicker_ok, quicker = pcall(require, "quicker")

wk.add({

  {
    "<leader>?",
    function() wk.show({ global = true }) end,
    desc = "Wyświetl wszystkie skróty",
  },
  {
    "<leader>q",
    function()
      if quicker_ok then
        quicker.toggle()
      end
    end,
    desc = "Pokaż quickfixy",
  },
  {
    "<leader>n",
    function()
      vim.cmd("Neotree right toggle")
    end,
    desc = "Pokaż/ukryj drzewo plików",
  },
  {
    "<leader>f",
    function()
      require("conform").format({ async = true })
    end,
    desc = "Sformatuj plik"
  }

})
