local M = {}

M.settings = {}

M.root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern("manage.py", "pyproject.toml")(fname)
end

return M
