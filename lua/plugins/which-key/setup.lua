-- Konfiguracja wyglądu which-key
-- Wszystkie keymaps są w lua/config/keymaps.lua

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
