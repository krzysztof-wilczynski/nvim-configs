local M = {}

function M.get_capabilities()
  local ok, cmp = pcall(require, "blink.cmp")
  if ok then
    return cmp.get_lsp_capabilities()
  else
    return vim.lsp.protocol.make_client_capabilities()
  end
end

M.on_attach = function(_, bufnr)
  if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end
M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = "rounded",
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  }),
}

return M
