return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    auto_restore = false,  -- nie przywracaj automatycznie, wybierz z pickera
    auto_save = true,      -- zapisuj przy wyjściu
    use_git_branch = true, -- osobna sesja per branch

    -- Zamknij te okna przed zapisem sesji
    pre_save_cmds = {
      "Neotree close",
      "Trouble close",
      function()
        -- Zamknij wszystkie terminale
        local terms = require("toggleterm.terminal").get_all()
        for _, term in ipairs(terms) do
          term:close()
        end
      end,
    },

    -- Session lens (picker)
    session_lens = {
      load_on_setup = true,
      previewer = false,
      theme_conf = {
        border = true,
        winblend = 0,
      },
    },
  },

  keys = {
    { "<leader>Sl", "<cmd>AutoSession search<CR>",  desc = "Lista sesji" },
    { "<leader>Ss", "<cmd>AutoSession save<CR>",    desc = "Zapisz sesję" },
    { "<leader>Sr", "<cmd>AutoSession restore<CR>", desc = "Przywróć sesję" },
    { "<leader>Sd", "<cmd>AutoSession delete<CR>",  desc = "Usuń sesję" },
  },
}
