return {
  "folke/snacks.nvim",
  priority = 2137,
  lazy = false,
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "n", desc = "Nowy plik", action = ":ene | startinsert" },
          { icon = " ", key = "f", desc = "Znajdź plik", action = ":lua Snacks.dashboard.pick('files')" },
          {
            icon = " ",
            key = "r",
            desc = "Ostatnie pliki",
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = " ",
            key = "c",
            desc = "Ustawienia",
            action = ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>",
          },
          { icon = " ", key = "s", desc = "Przywróć sesję", section = "session" },
          {
            icon = "󰒲 ",
            key = "L",
            desc = "Lazy",
            action = ":Lazy",
            enabled = package.loaded.lazy ~= nil,
          },
          { icon = " ", key = "q", desc = "Wyjdź", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        {
          pane = 2,
          icon = " ",
          desc = "Przejrzyj repozytorium",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
}
