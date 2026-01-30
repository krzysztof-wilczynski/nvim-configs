return {
  -- Debugger dla Python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python")
    end,
  },

  -- Adapter testów dla neotest
  {
    "nvim-neotest/neotest-python",
    ft = "python",
    dependencies = { "nvim-neotest/neotest" },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            args = { "--tb=short" },
            runner = "pytest",
            python = ".venv/bin/python",
          }),
        },
      })
    end,
  },

  -- Wybór środowiska wirtualnego
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    cmd = "VenvSelect",
    ft = "python",
    opts = {
      name = { "venv", ".venv", "env", ".env" },
      auto_refresh = true,
    },
    keys = {
      { "<leader>pv", "<cmd>VenvSelect<CR>", desc = "🐍 Wybierz venv", ft = "python" },
    },
  },
}
