local M = {}

M.settings = {
  ["rust-analyzer"] = {
    cargo = {
      allFeatures = true,
      -- Możesz dodać inne opcje cargo, np. features = "foo,bar"
    },
    checkOnSave = {
      command = "clippy", -- automatyczne sprawdzanie przez Clippy przy zapisie
    },
    inlayHints = {
      enable = true,
      -- Możesz dodać inne opcje, np. typeHints = true, parameterHints = true
    },
    diagnostics = {
      enable = true,
      disabled = { "unresolved-proc-macro" }, -- wyłącz wybrane ostrzeżenia
    },
    procMacro = {
      enable = true,
    },
    files = {
      excludeDirs = { ".direnv", ".git", "target" },
    },
    lens = {
      enable = true,
      references = true,
      methodReferences = true,
    },
    completion = {
      postfix = {
        enable = true,
      },
      autoimport = {
        enable = true,
      },
    },
    -- Możesz dodać inne sekcje według potrzeb
  },
}

return M
