return {
  -- DAP core
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      -- UI dla debuggera
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {
          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.33 },
                { id = "breakpoints", size = 0.17 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
              },
              size = 0.33,
              position = "right",
            },
            {
              elements = {
                { id = "repl", size = 0.45 },
                { id = "console", size = 0.55 },
              },
              size = 0.27,
              position = "bottom",
            },
          },
        },
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)

          -- Automatycznie otwieraj/zamykaj UI
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },

      -- Wirtualny tekst z wartosciami zmiennych
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
          enabled = true,
          enabled_commands = true,
          highlight_changed_variables = true,
          highlight_new_as_changed = false,
          show_stop_reason = true,
          commented = false,
        },
      },
    },

    config = function()
      -- Ikony breakpointow
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticError",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = "",
        texthl = "DiagnosticWarn",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "DiagnosticError",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapLogPoint", {
        text = "",
        texthl = "DiagnosticInfo",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapStopped", {
        text = "",
        texthl = "DiagnosticOk",
        linehl = "DapStoppedLine",
        numhl = "",
      })

      -- Kolor linii zatrzymania
      vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#3d4220" })
    end,
  },

  -- Mason DAP - automatyczna instalacja codelldb
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      ensure_installed = { "codelldb" },
      automatic_installation = true,
      handlers = {},
    },
  },
}
