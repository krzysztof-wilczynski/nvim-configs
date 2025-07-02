-- lua/plugins/autocompletion.lua

return {
  -- Silnik snippetów: LuaSnip + friendly-snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    event = "InsertEnter",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          -- Możesz też ładować własne snippety z katalogu config/snippets:
          -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      enable_autosnippets = true,
    },
  },

  -- blink.cmp z integracją LuaSnip i Twoimi ustawieniami
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    },
    opts = {
      keymap = { preset = "default" }, -- możesz zmienić na "vscode" lub własny
      snippets = {
        preset = "luasnip",            -- kluczowe!
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        trigger = {
          show_on_trigger_character = true,
          show_on_insert_on_trigger_character = true,
          show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
        },
        menu = {
          auto_show = true,
          border = "rounded",
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind",              gap = 1 },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = { border = "rounded" },
        },
        list = { selection = { preselect = false, auto_insert = true } },
        ghost_text = { enabled = true },
      },
      signature = { enabled = true, window = { border = "rounded" } },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
        kind_icons = {
          Boolean = "[] Boolean",
          Character = "[] Character",
          Class = "[] Class",
          Color = "[] Color",
          Constant = "[] Constant",
          Constructor = "[] Constructor",
          Enum = "[] Enum",
          EnumMember = "[] EnumMember",
          Event = "[ﳅ] Event",
          Field = "[] Field",
          File = "[] File",
          Folder = "[ﱮ] Folder",
          Function = "[ﬦ] Function",
          Interface = "[] Interface",
          Keyword = "[] Keyword",
          Method = "[] Method",
          Module = "[] Module",
          Number = "[] Number",
          Operator = "[Ψ] Operator",
          Parameter = "[] Parameter",
          Property = "[ﭬ] Property",
          Reference = "[] Reference",
          Snippet = "[] Snippet",
          String = "[] String",
          Struct = "[ﯟ] Struct",
          Text = "[] Text",
          TypeParameter = "[] TypeParameter",
          Unit = "[] Unit",
          Value = "[] Value",
          Variable = "[ﳛ] Variable",
          Copilot = "",
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
