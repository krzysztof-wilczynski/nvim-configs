local lsp_common = require("config.lsp.common")

return {
  -- {
  --   "simrat39/rust-tools.nvim",
  --   ft = "rust",
  --   dependencies = { "neovim/nvim-lspconfig" },
  --   config = function()
  --     local rust_tools = require("rust-tools")
  --     rust_tools.setup({
  --       server = {
  --         on_attach = lsp_common.on_attach,
  --         capabilities = lsp_common.capabilities,
  --         handlers = lsp_common.handlers,
  --         settings = require("config.lsp.servers.rust_analyzer").settings,
  --       },
  --       tools = {
  --         inlay_hints = { auto = true },
  --         hover_actions = { auto_focus = true },
  --       },
  --       -- opcjonalnie: integracja z DAP (debugger)
  --       -- dap = { adapter = ... }
  --     })
  --   end,
  -- },
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
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
    ft = { "rust" },
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
