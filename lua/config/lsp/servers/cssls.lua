local M = {}

M.settings = {
  css = {
    validate = true,
    lint = {
      unknownAtRules = "ignore", -- Ignoruj @tailwind, @apply etc. na wypadek użycia
    },
  },
  scss = {
    validate = true,
    lint = {
      unknownAtRules = "ignore",
    },
  },
  less = {
    validate = true,
    lint = {
      unknownAtRules = "ignore",
    },
  },
}

M.filetypes = { "css", "scss", "less" }

return M
