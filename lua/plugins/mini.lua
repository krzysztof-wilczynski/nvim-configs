return {
  {
    "echasnovski/mini.operators",
    version = false,
    config = function()
      require("mini.operators").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "echasnovski/mini.icons",
    version = false,
    config = function()
      require("mini.icons").setup()
    end,
  },
  {
    "echasnovski/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.notify",
    version = false,
    config = function()
      -- Ustaw własny format powiadomień: ikona, czas, poziom, wiadomość
      local icons = {
        ERROR = "",
        WARN  = "",
        INFO  = "",
        DEBUG = "",
        TRACE = "󰙎",
        OFF   = "",
      }

      require("mini.notify").setup({
        content = {
          format = function(notif)
            local icon = icons[notif.level] or ""
            local time = os.date("%H:%M:%S", notif.ts_update)
            local level = notif.level:sub(1, 1):upper() .. notif.level:sub(2):lower()
            return string.format("%s [%s] %s: %s", icon, time, level, notif.msg)
          end,
          -- Najnowsze powiadomienia na górze
          sort = function(notif_arr)
            table.sort(notif_arr, function(a, b) return a.ts_update > b.ts_update end)
            return notif_arr
          end,
        },
        lsp_progress = {
          enable = true,
          level = "INFO",
          duration_last = 2000,
        },
        window = {
          config = function()
            return {
              anchor = "SE",
              col = vim.o.columns,
              row = vim.o.rows, -- górny prawy róg
              border = "rounded",
              zindex = 2000,
            }
          end,
          max_width_share = 0.45, -- szersze okno
          winblend = 15,          -- lekka przezroczystość
        },
      })

      -- Ustaw mini.notify jako domyślny handler powiadomień
      vim.notify = require("mini.notify").make_notify({
        ERROR = { duration = 8000, hl_group = "DiagnosticError" },
        WARN  = { duration = 6000, hl_group = "DiagnosticWarn" },
        INFO  = { duration = 4000, hl_group = "DiagnosticInfo" },
        DEBUG = { duration = 3000, hl_group = "DiagnosticHint" },
        TRACE = { duration = 2000, hl_group = "DiagnosticOk" },
        OFF   = { duration = 1500, hl_group = "MiniNotifyNormal" },
      })
    end,
  }
}
