local M = {}

M.settings = {
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
    hint = {
      enable = true,
      arrayIndex = "Disable",
    },
    workspace = {
      checkThirdParty = false,
    },
    telemetry = {
      enable = false,
    },
    format = {
      enable = true,
      defaultConfig = {
        indent_style = "space",
        indent_size = "2",
      },
    },
  },
}

return M
