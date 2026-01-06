return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.notify",
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("noice").setup({
      notify = {
        enabled = true,
        view = "mini",
      },
      lsp = {
        progress = { enabled = false },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        }
      },
      cmdline = {
        enabled = true,
        view = "cmdline",
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
      },
      routes = {
        -- Ukryj powiadomienia treesitter o kompilacji parserów
        { filter = { find = "nvim%-treesitter" }, opts = { skip = true } },
      },
      views = {
        mini = {
          align = "message-left", -- wyrównanie do lewej
          position = {
            row = "90%",          -- dolny róg (możesz zmienić na "10%" dla góry)
            col = "100%",         -- prawy róg
          },
          size = {
            width = "30%",
            height = "auto",
          },
          border = { style = "rounded" },
        },
      },
    })
  end
}
