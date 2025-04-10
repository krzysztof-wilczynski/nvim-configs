-- Plugin replacing UI for messages, cmdline and popupmenu
--
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    cmdline = {
      enabled = true,
      view = "cmdline"
    },
    presets = {
      bottom_search = true,
      long_message_to_split = true,
    },

  },
  dependencies = {
    "rcarriga/nvim-notify",
  },
}
