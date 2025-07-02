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

local windows_keys = {
  {
    "<leader>w", group = "Okna",
  },
  {
    "<leader>ws",
    "<C-W>s",
    desc = "Podziel okno w pionie"
  },
  {
    "<leader>wv",
    "<C-W>v",
    desc = "Podziel okno w poziomie"
  },
  {
    "<leader>wq",
    "<C-W>c",
    desc = "Usuń okno"
  }
}

-- SEKCJA: Inne (przykład)
local misc_keys = {
  {
    "<leader>?",
    function() wk.show({ global = true }) end,
    desc = "Wyświetl wszystkie skróty",
  },
  {
    "<leader>n",
    "<cmd>Neotree toggle position=right<CR>",
    desc = "Otwórz drzewo plików"
  }
  -- Dodaj tu kolejne uniwersalne skróty...
}

local code_keys = {
  {
    "<leader>c", group = "Kod",
  },
}

local function cargo_keymaps(bufnr)
  local cargo_opts = { mode = "n", buffer = bufnr }
  wk.add({
    { "<leader>c", group = "Cargo", cargo_opts },

    -- Najważniejsze polecenia bezpośrednio pod <leader>c
    { "<leader>cb", "<cmd>CargoBuild<CR>", desc = "🏗️ Buduj projekt", cargo_opts },
    { "<leader>cr", "<cmd>CargoRun<CR>", desc = "▶️ Uruchom (okno)", cargo_opts },
    { "<leader>cR", "<cmd>CargoRunTerm<CR>", desc = "📟 Uruchom w terminalu", cargo_opts },
    { "<leader>ct", "<cmd>CargoTest<CR>", desc = "🧪 Testuj", cargo_opts },
    { "<leader>cB", "<cmd>CargoBench<CR>", desc = "📊 Benchmark", cargo_opts },
    { "<leader>cc", "<cmd>CargoClean<CR>", desc = "🧹 Wyczyść artefakty", cargo_opts },
    { "<leader>ck", "<cmd>CargoCheck<CR>", desc = "🔍 Sprawdź błędy", cargo_opts },
    { "<leader>cl", "<cmd>CargoClippy<CR>", desc = "📋 Lintuj (Clippy)", cargo_opts },
    { "<leader>cx", "<cmd>CargoFix<CR>", desc = "🔧 Napraw ostrzeżenia", cargo_opts },
    { "<leader>cf", "<cmd>CargoFmt<CR>", desc = "🎨 Formatuj kod", cargo_opts },

    -- Zależności (podgrupa)
    { "<leader>cd", group = "Zależności", cargo_opts },
    { "<leader>cda", "<cmd>CargoAdd<CR>", desc = "➕ Dodaj zależność", cargo_opts },
    { "<leader>cdx", "<cmd>CargoRemove<CR>", desc = "➖ Usuń zależność", cargo_opts },
    { "<leader>cdu", "<cmd>CargoUpdate<CR>", desc = "🔄 Aktualizuj zależności", cargo_opts },
    { "<leader>cdo", "<cmd>CargoOutdated<CR>", desc = "📊 Przestarzałe zależności", cargo_opts },
    { "<leader>cdA", "<cmd>CargoAudit<CR>", desc = "🛡️ Audyt zależności", cargo_opts },
    { "<leader>cdv", "<cmd>CargoVendor<CR>", desc = "📦 Vendoruj zależności", cargo_opts },
    { "<leader>cdt", "<cmd>CargoTree<CR>", desc = "🌲 Drzewo zależności", cargo_opts },
    { "<leader>cdd", "<cmd>CargoAutodd<CR>", desc = "🤖 Zarządzaj automatycznie", cargo_opts },

    -- Publikacja, dokumentacja, narzędzia (podgrupa)
    { "<leader>cp", group = "Publikacja i narzędzia", cargo_opts },
    { "<leader>cpd", "<cmd>CargoDoc<CR>", desc = "📚 Dokumentacja", cargo_opts },
    { "<leader>cpp", "<cmd>CargoPublish<CR>", desc = "📦 Publikuj pakiet", cargo_opts },
    { "<leader>cpi", "<cmd>CargoInstall<CR>", desc = "📥 Instaluj binarkę", cargo_opts },
    { "<leader>cpu", "<cmd>CargoUninstall<CR>", desc = "📤 Odinstaluj binarkę", cargo_opts },
    { "<leader>cps", "<cmd>CargoSearch<CR>", desc = "🔎 Szukaj pakietów", cargo_opts },
    { "<leader>cpn", "<cmd>CargoNew<CR>", desc = "✨ Nowy projekt", cargo_opts },

    { "<leader>cj", "<cmd>RustLsp joinLines<CR>", desc = "Złącz linie", cargo_opts }
  })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(args)
    cargo_keymaps(args.buf)
  end,
})

-- Rejestracja wszystkich sekcji
wk.add(file_keys)
wk.add(git_keys)
wk.add(lsp_keys)
wk.add(windows_keys)
wk.add(misc_keys)
wk.add(code_keys)
