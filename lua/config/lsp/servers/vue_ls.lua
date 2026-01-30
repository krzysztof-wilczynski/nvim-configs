local M = {}

M.settings = {
  vue = {
    -- Hybrid Mode - vue_ls obsługuje tylko szablony
    -- TypeScript obsługiwany przez ts_ls z @vue/typescript-plugin
    hybridMode = true,
  },
}

M.filetypes = { "vue" }

return M
