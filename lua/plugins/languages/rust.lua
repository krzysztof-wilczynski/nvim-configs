local lsp_common = require("config.lsp.common")

return {
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local rust_tools = require("rust-tools")
      rust_tools.setup({
        server = {
          on_attach = lsp_common.on_attach,
          capabilities = lsp_common.capabilities,
          handlers = lsp_common.handlers,
          settings = require("config.lsp.servers.rust_analyzer").settings,
        },
        tools = {
          inlay_hints = { auto = true },
          hover_actions = { auto_focus = true },
        },
        -- opcjonalnie: integracja z DAP (debugger)
        -- dap = { adapter = ... }
      })
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  }
}
