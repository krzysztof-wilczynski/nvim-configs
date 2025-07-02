vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.isdirectory(".git") == 1 then
            vim.cmd("Neotree right reveal")
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = { "*lazygit*" },
  group = vim.api.nvim_create_augroup("git_refresh_neotree", { clear = true }),
  callback = function()
    require("neo-tree.sources.filesystem.commands").refresh(
      require("neo-tree.sources.manager").get_state("filesystem")
    )
  end,
})
