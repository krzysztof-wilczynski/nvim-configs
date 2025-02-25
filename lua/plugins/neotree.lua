return {
   "nvim-neo-tree/neo-tree.nvim",
    branch="v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },

  config = function()
    vim.keymap.set("n", '<leader>n', ':Neotree filesystem float<CR>', {})
    vim.keymap.set("n", '<leader>g', ':Neotree float git_status<CR>', {}) 
  end
} 

