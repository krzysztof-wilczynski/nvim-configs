local M = {}

-- Znajdź ścieżkę do @vue/typescript-plugin w instalacji Mason
local function get_vue_plugin_path()
  local mason_registry = require("mason-registry")
  if mason_registry.is_installed("vue-language-server") then
    local vue_pkg = mason_registry.get_package("vue-language-server")
    local vue_path = vue_pkg:get_install_path()
    return vue_path .. "/node_modules/@vue/language-server"
  end
  return nil
end

M.init_options = {
  plugins = {
    {
      name = "@vue/typescript-plugin",
      location = get_vue_plugin_path(),
      languages = { "vue" },
    },
  },
}

-- WAŻNE: vue MUSI być w filetypes dla Hybrid Mode!
M.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

M.settings = {
  typescript = {
    inlayHints = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
  javascript = {
    inlayHints = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
}

return M
