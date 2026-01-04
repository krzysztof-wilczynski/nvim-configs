return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    dependencies = { "mfussenegger/nvim-dap" },
    init = function()
      vim.g.rustaceanvim = {
        -- DAP integration
        dap = {
          autoload_configurations = true,
        },
        -- Server config
        server = {
          on_attach = function(client, bufnr)
            require("config.lsp.common").on_attach(client, bufnr)
          end,
          default_settings = require("config.lsp.servers.rust_analyzer").settings,
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
  {
    "nwiizo/cargo.nvim",
    build = "cargo build --release",
    config = function()
      require("cargo").setup({
        float_window = true,
        window_width = 0.8,
        window_height = 0.8,
        border = "rounded",
        auto_close = true,
        close_timeout = 5000,
      })
    end,
    cmd = {
      "CargoBench",
      "CargoBuild",
      "CargoClean",
      "CargoDoc",
      "CargoNew",
      "CargoRun",
      "CargoRunTerm",
      "CargoTest",
      "CargoUpdate",
      "CargoCheck",
      "CargoClippy",
      "CargoAdd",
      "CargoRemove",
      "CargoFmt",
      "CargoFix"
    }
  }
}
