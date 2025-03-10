vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = { "*lazygit*" },
  group = vim.api.nvim_create_augroup("git_refresh_neotree", { clear = true }),
  callback = function()
    require("neo-tree.sources.filesystem.commands").refresh(
      require("neo-tree.sources.manager").get_state("filesystem")
    )
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    if vim.bo.modified == true and mode == 'n' then
      vim.cmd('lua vim.lsp.buf.format()')
    end
  end
})
