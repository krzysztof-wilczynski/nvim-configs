return {
  -- Zarządzanie zależnościami package.json (jak crates.nvim dla Rust)
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "json",
    event = "BufRead package.json",
    opts = {
      colors = {
        up_to_date = "#3C4048",
        outdated = "#d19a66",
      },
      icons = {
        enable = true,
        style = {
          up_to_date = "|  ",
          outdated = "|  ",
        },
      },
      autostart = true,
      hide_up_to_date = false,
      hide_unstable_versions = false,
      package_manager = "pnpm",
    },
    keys = {
      { "<leader>vs", function() require("package-info").show() end, desc = "📦 Pokaż wersje", ft = "json" },
      { "<leader>vh", function() require("package-info").hide() end, desc = "📦 Ukryj wersje", ft = "json" },
      { "<leader>vu", function() require("package-info").update() end, desc = "📦 Aktualizuj pakiet", ft = "json" },
      { "<leader>vd", function() require("package-info").delete() end, desc = "📦 Usuń pakiet", ft = "json" },
      { "<leader>vi", function() require("package-info").install() end, desc = "📦 Zainstaluj pakiet", ft = "json" },
      { "<leader>vc", function() require("package-info").change_version() end, desc = "📦 Zmień wersję", ft = "json" },
    },
  },

  -- Adapter testów Vitest dla neotest
  {
    "marilari88/neotest-vitest",
    ft = { "javascript", "typescript", "vue" },
    dependencies = { "nvim-neotest/neotest" },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest")({
            -- Domyślna konfiguracja vitest
            vitestCommand = "pnpm vitest",
          }),
        },
      })
    end,
  },

  -- Schematy JSON dla tsconfig.json, package.json
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
