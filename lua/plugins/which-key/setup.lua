local present, wk = pcall(require, "which-key")
if not present then
  return
end

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
  },
  preset = "helix",
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  win = {
    border = "rounded",
    padding = { 1, 1, 1, 1 },
  },
  show_help = true,
})

-- SEKCJA: Pliki i wyszukiwanie
local file_keys = {
  { "<leader>f", group = "Szukaj" },
  {
    "<leader><space>",
    function() require("snacks").picker.smart() end,
    desc = "Wyszukaj...",
  },
  {
    "<leader>fa",
    function() require("snacks").picker.commands() end,
    desc = "Szukaj poleceń",
  },
  {
    "<leader>fc",
    function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end,
    desc = "Szukaj plików w configu",
  },
  {
    "<leader>ff",
    function() require("snacks").picker.files() end,
    desc = "Szukaj plików",
  },
  {
    "<leader>fg",
    function() require("snacks").picker.grep() end,
    desc = "Grepuj",
  },
  {
    "<leader>fh",
    function() require("snacks").picker.help() end,
    desc = "Szukaj w plikach pomocy",
  },
  {
    "<leader>fk",
    function() require("snacks").picker.keymaps() end,
    desc = "Szukaj skrótów klawiszowych",
  },
  {
    "<leader>fn",
    function() require("snacks").picker.notifications() end,
    desc = "Powiadomienia",
  },
  {
    "<leader>fq",
    function() require("snacks").picker.qflist() end,
    desc = "Quickfixy",
  },
  {
    "<leader>fp",
    function() require("snacks").picker.projects() end,
    desc = "Projekty",
  },
  {
    "<leader>fr",
    function() require("snacks").picker.recent() end,
    desc = "Ostatnie pliki",
  },
  {
    "<leader>ft",
    function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end,
    desc = "TODO",
  },
  {
    "<leader>f]",
    function() require("snacks").picker.colorschemes() end,
    desc = "Schematy kolorystyczne",
  },
}

-- SEKCJA: Git
local git_keys = {
  { "<leader>g", group = "Git" },
  {
    "<leader>gg",
    function() require("snacks").lazygit() end,
    desc = "LazyGit",
  },
  {
    "<leader>gb",
    function() require("snacks").picker.git_branches() end,
    desc = "Git Branches",
  },
  {
    "<leader>gd",
    function() require("snacks").picker.git_diff() end,
    desc = "Git Diff",
  },
  {
    "<leader>gf",
    function() require("snacks").picker.git_log_file() end,
    desc = "Git Log File",
  },
  {
    "<leader>gl",
    function() require("snacks").picker.git_log() end,
    desc = "Git Log",
  },
  {
    "<leader>gL",
    function() require("snacks").picker.git_log_line() end,
    desc = "Git Log Line",
  },
  {
    "<leader>go",
    function() require("snacks").gitbrowse() end,
    desc = "Remote",
  },
  {
    "<leader>gs",
    function() require("snacks").picker.git_status() end,
    desc = "Git Status",
  },
  {
    "<leader>gS",
    function() require("snacks").picker.git_stash() end,
    desc = "Git Stash",
  },
}

-- SEKCJA: LSP
local lsp_keys = {
  {
    "gd",
    function() require("snacks").picker.lsp_definitions() end,
    desc = "Definicje",
  },
  {
    "gD",
    function() require("snacks").picker.lsp_declarations() end,
    desc = "Deklaracje",
  },
  {
    "gr",
    function() require("snacks").picker.lsp_references() end,
    nowait = true,
    desc = "Odniesienia",
  },
  {
    "gI",
    function() require("snacks").picker.lsp_implementations() end,
    desc = "Implementacje",
  },
  {
    "gy",
    function() require("snacks").picker.lsp_type_definitions() end,
    desc = "Typy",
  },
  {
    "<leader>fs",
    function() require("snacks").picker.lsp_symbols() end,
    desc = "LSP Symbols",
  },
  {
    "<leader>fS",
    function() require("snacks").picker.lsp_workspace_symbols() end,
    desc = "LSP Workspace Symbols",
  },
}

-- SEKCJA: Inne (przykład)
local misc_keys = {
  {
    "<leader>?",
    function() wk.show({ global = true }) end,
    desc = "Wyświetl wszystkie skróty",
  },
  -- Dodaj tu kolejne uniwersalne skróty...
}

-- Rejestracja wszystkich sekcji
wk.add(file_keys)
wk.add(git_keys)
wk.add(lsp_keys)
wk.add(misc_keys)
