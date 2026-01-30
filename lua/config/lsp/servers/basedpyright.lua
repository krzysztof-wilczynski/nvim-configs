local M = {}

M.settings = {
  basedpyright = {
    analysis = {
      typeCheckingMode = "standard",
      autoImportCompletions = true,
      diagnosticMode = "openFilesOnly",
      useLibraryCodeForTypes = true,
    },
  },
}

return M
