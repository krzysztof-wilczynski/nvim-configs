return {
  "folke/snacks.nvim",
  dependencies = {
    "folke/todo-comments.nvim",
  },
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
            action = ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd",
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
    picker = {
      enabled = true,
    },
  },
  keys = {
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Wyszukaj..."},
    { "<leader>fa", function() Snacks.picker.commands() end, desc = "Szukaj poleceń"},
    { "<leader>fc", function() Snacks.picker.files({cwd = vim.fn.stdpath("config")}) end, desc = "Szukaj plików w configu"},
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Szukaj plików"},
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grepuj"},
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Szukaj w plikach pomocy"},
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Szukaj skrótów klawiszowych"},
    { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Szukaj quickfixów"},
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Szukaj projektów"},
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Ostatnie pliki"},
    { "<leader>ft", function() Snacks.picker.todo_comments({keywords = {"TODO", "FIX", "FIXME"}}) end, desc = "Szukaj TODO"},
    { "<leader>f]", function() Snacks.picker.colorschemes() end, desc = "Szukaj schematów kolorystycznych"},

    -- git
    { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Otwórz LazyGit" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
  },
}
