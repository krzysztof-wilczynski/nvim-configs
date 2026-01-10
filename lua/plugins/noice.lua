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
      messages = {
        enabled = true,
        view = "mini",
        view_error = "mini",
        view_warn = "mini",
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
        cmdline_output_to_split = false,
      },
      routes = {
        -- Ukryj "recording @x" - mamy wskaźnik w lualine
        { filter = { event = "msg_showmode" },                              opts = { skip = true } },
        { filter = { find = "nvim%-treesitter" },                           opts = { skip = true } },
        { filter = { event = "msg_show", kind = "", find = "written" },     opts = { skip = true } },
        { filter = { event = "msg_show", kind = "", find = "fewer lines" }, opts = { skip = true } },
        { filter = { event = "msg_show", kind = "", find = "more lines" },  opts = { skip = true } },
        { filter = { event = "msg_show", kind = "", find = "yanked" },      opts = { skip = true } },
        { filter = { event = "msg_show", kind = "search_count" },           opts = { skip = true } },
        { filter = { event = "msg_show", find = "search hit" },             opts = { skip = true } },
        { filter = { event = "msg_show", find = "Pattern not found" },      view = "mini" },
        -- Rejestry wyświetlaj w vsplit (nie jako mini)
        { filter = { event = "msg_show", find = "Type Name Content" },      view = "vsplit" },
        { filter = { event = "msg_show" },                                  view = "mini" },
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
