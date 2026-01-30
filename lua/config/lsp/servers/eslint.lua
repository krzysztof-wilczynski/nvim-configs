local M = {}

M.settings = {
  -- Automatyczny format przy zapisie
  codeActionOnSave = {
    enable = true,
    mode = "all",
  },
  -- Obsługa Vue i TypeScript
  validate = "on",
  format = true,
}

M.filetypes = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
  "vue",
}

return M
