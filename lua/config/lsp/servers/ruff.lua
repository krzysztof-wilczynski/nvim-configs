local M = {}

M.on_attach = function(client, bufnr)
  -- Wyłącz hover - defer do basedpyright
  client.server_capabilities.hoverProvider = false
end

return M
