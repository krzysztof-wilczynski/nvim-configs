-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                         SKRÓTY KLAWISZOWE                                ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

local keymap = vim.keymap.set
local wk = require("which-key")

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                        PODSTAWOWE SKRÓTY                                 │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Wyczyść podświetlenie wyszukiwania
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Wyłącz strzałki (użyj hjkl)
keymap("n", "<left>", '<cmd>echo "Użyj h"<CR>')
keymap("n", "<right>", '<cmd>echo "Użyj l"<CR>')
keymap("n", "<up>", '<cmd>echo "Użyj k"<CR>')
keymap("n", "<down>", '<cmd>echo "Użyj j"<CR>')

-- Nawigacja między oknami
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "🪟 Fokus lewo" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "🪟 Fokus prawo" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "🪟 Fokus dół" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "🪟 Fokus góra" })

-- Wcięcia (pozostań w trybie visual)
keymap("v", "<", "<gv", { desc = "⬅️ Zmniejsz wcięcie" })
keymap("v", ">", ">gv", { desc = "➡️ Zwiększ wcięcie" })

-- Zapisywanie
keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "💾 Zapisz", silent = true })
keymap("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "💾 Zapisz", silent = true })

-- Usuwanie bez kopiowania do rejestru
keymap("n", "x", '"_x', { silent = true })
keymap("n", "X", '"_X', { silent = true })
keymap("v", "x", '"_x', { silent = true })
keymap("v", "X", '"_X', { silent = true })

-- Nowa linia (jak w IDE)
keymap("i", "<C-CR>", "<Esc>o", { desc = "Nowa linia" })

-- Rozmiar czcionki (GUI)
keymap("n", "<C-=>", function() pcall(function() require("utils").adjust_font_size(1) end) end, { silent = true })
keymap("n", "<C-->", function() pcall(function() require("utils").adjust_font_size(-1) end) end, { silent = true })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                    NAWIGACJA MIĘDZY FUNKCJAMI/KLASAMI                    │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Nawigacja do następnej/poprzedniej funkcji (używa mini.ai)
keymap({ "n", "x", "o" }, "]m", function() require("mini.ai").move_cursor("left", "a", "f", { search_method = "next" }) end, { desc = "Następna funkcja" })
keymap({ "n", "x", "o" }, "[m", function() require("mini.ai").move_cursor("left", "a", "f", { search_method = "prev" }) end, { desc = "Poprzednia funkcja" })
keymap({ "n", "x", "o" }, "]]", function() require("mini.ai").move_cursor("left", "a", "c", { search_method = "next" }) end, { desc = "Następna klasa" })
keymap({ "n", "x", "o" }, "[[", function() require("mini.ai").move_cursor("left", "a", "c", { search_method = "prev" }) end, { desc = "Poprzednia klasa" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                      WHICH-KEY: SZUKAJ (f)                               │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "<leader>f", group = "🔍 Szukaj" },
  { "<leader><space>", function() require("snacks").picker.smart() end, desc = "🔍 Inteligentne wyszukiwanie" },
  { "<leader>ff", function() require("snacks").picker.files() end, desc = "📄 Pliki" },
  { "<leader>fg", function() require("snacks").picker.grep() end, desc = "🔎 Grep (szukaj w treści)" },
  { "<leader>fr", function() require("snacks").picker.recent() end, desc = "🕐 Ostatnie pliki" },
  { "<leader>fb", function() require("snacks").picker.buffers() end, desc = "📑 Bufory" },
  { "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "⚙️ Pliki konfiguracji" },
  { "<leader>fh", function() require("snacks").picker.help() end, desc = "❓ Pomoc" },
  { "<leader>fk", function() require("snacks").picker.keymaps() end, desc = "⌨️ Skróty klawiszowe" },
  { "<leader>fa", function() require("snacks").picker.commands() end, desc = "📋 Polecenia" },
  { "<leader>fp", function() require("snacks").picker.projects() end, desc = "📁 Projekty" },
  { "<leader>fn", function() require("snacks").picker.notifications() end, desc = "🔔 Powiadomienia" },
  { "<leader>fq", function() require("snacks").picker.qflist() end, desc = "📝 Lista quickfix" },
  { "<leader>ft", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "✅ TODO" },
  { "<leader>f]", function() require("snacks").picker.colorschemes() end, desc = "🎨 Motywy kolorów" },
  { "<leader>fs", function() require("snacks").picker.lsp_symbols() end, desc = "🏷️ Symbole LSP" },
  { "<leader>fS", function() require("snacks").picker.lsp_workspace_symbols() end, desc = "🏷️ Symbole workspace" },
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                        WHICH-KEY: GIT (g)                                │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "<leader>g", group = "📂 Git" },
  { "<leader>gg", function() require("snacks").lazygit() end, desc = "🚀 LazyGit" },
  { "<leader>gs", function() require("snacks").picker.git_status() end, desc = "📊 Status" },
  { "<leader>gb", function() require("snacks").picker.git_branches() end, desc = "🌿 Gałęzie" },
  { "<leader>gl", function() require("snacks").picker.git_log() end, desc = "📜 Historia" },
  { "<leader>gL", function() require("snacks").picker.git_log_line() end, desc = "📜 Historia linii" },
  { "<leader>gf", function() require("snacks").picker.git_log_file() end, desc = "📜 Historia pliku" },
  { "<leader>gd", function() require("snacks").picker.git_diff() end, desc = "🔄 Różnice" },
  { "<leader>gS", function() require("snacks").picker.git_stash() end, desc = "📦 Schowek (stash)" },
  { "<leader>go", function() require("snacks").gitbrowse() end, desc = "🌐 Otwórz w przeglądarce" },

  -- Gitsigns (hunks)
  { "<leader>gh", group = "Hunks" },
  { "<leader>ghs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
  { "<leader>ghr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
  { "<leader>ghS", function() require("gitsigns").stage_buffer() end, desc = "Stage buffer" },
  { "<leader>ghR", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
  { "<leader>ghp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
  { "<leader>ghb", function() require("gitsigns").blame_line() end, desc = "Blame line" },
  { "<leader>ghd", function() require("gitsigns").diffthis() end, desc = "Diff this" },

  -- Nawigacja między hunkami
  { "]c", function() require("gitsigns").nav_hunk("next") end, desc = "Następny hunk" },
  { "[c", function() require("gitsigns").nav_hunk("prev") end, desc = "Poprzedni hunk" },
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                        WHICH-KEY: LSP (g*)                               │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "K", vim.lsp.buf.hover, desc = "📖 Dokumentacja (hover)" },
  { "gd", function() require("snacks").picker.lsp_definitions() end, desc = "🛠️ Idź do definicji" },
  { "gD", function() require("snacks").picker.lsp_declarations() end, desc = "🛠️ Idź do deklaracji" },
  { "gr", function() require("snacks").picker.lsp_references() end, desc = "🔗 Odniesienia", nowait = true },
  { "gI", function() require("snacks").picker.lsp_implementations() end, desc = "🔧 Implementacje" },
  { "gy", function() require("snacks").picker.lsp_type_definitions() end, desc = "📐 Definicja typu" },
  { "<leader>q", vim.diagnostic.setloclist, desc = "📋 Lista diagnostyki" },

  -- Akcje kodu (g*)
  { "ga", vim.lsp.buf.code_action, desc = "💡 Akcje kodu" },
  { "gf", function()
    vim.lsp.buf.code_action({
      filter = function(a) return a.isPreferred end,
      apply = true,
    })
  end, desc = "🔧 Szybka poprawka" },
  { "gF", function()
    vim.lsp.buf.code_action({
      context = { only = { "source.fixAll" } },
      apply = true,
    })
  end, desc = "🔧 Napraw wszystko w pliku" },
  { "ge", vim.diagnostic.open_float, desc = "🔍 Pokaż błąd" },

  -- Nawigacja między błędami
  { "]d", vim.diagnostic.goto_next, desc = "Następny błąd" },
  { "[d", vim.diagnostic.goto_prev, desc = "Poprzedni błąd" },
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                       WHICH-KEY: OKNA (w)                                │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "<leader>w", group = "🪟 Okna" },
  { "<leader>ws", "<C-W>s", desc = "➖ Podziel poziomo" },
  { "<leader>wv", "<C-W>v", desc = "➕ Podziel pionowo" },
  { "<leader>wq", "<C-W>c", desc = "❌ Zamknij okno" },
  { "<leader>wo", "<C-W>o", desc = "🎯 Tylko to okno" },
  { "<leader>w=", "<C-W>=", desc = "⚖️ Wyrównaj rozmiary" },
})

-- Zmiana rozmiaru okien (Ctrl + strzałki)
keymap("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Zwiększ wysokość" })
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Zmniejsz wysokość" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Zmniejsz szerokość" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Zwiększ szerokość" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                     WHICH-KEY: ZAKŁADKI (tab)                            │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "<leader><tab>", group = "📑 Zakładki" },
  { "<leader><tab><tab>", "<cmd>tabnew<CR>", desc = "➕ Nowa zakładka" },
  { "<leader><tab>e", "<cmd>tabnext<CR>", desc = "➡️ Następna" },
  { "<leader><tab>q", "<cmd>tabprevious<CR>", desc = "⬅️ Poprzednia" },
  { "<leader><tab>d", "<cmd>tabclose<CR>", desc = "❌ Zamknij" },
  { "<leader><tab>l", "<cmd>tablast<CR>", desc = "⏭️ Ostatnia" },
  { "<leader><tab>f", "<cmd>tabfirst<CR>", desc = "⏮️ Pierwsza" },
  { "<leader><tab>o", "<cmd>tabonly<CR>", desc = "🎯 Tylko ta" },
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                    WHICH-KEY: CARGO/RUST (c)                             │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Funkcja do tworzenia nowego projektu
local function cargo_new()
  vim.ui.input({ prompt = "🦀 Nazwa projektu: " }, function(name)
    if name and name ~= "" then
      vim.cmd("CargoNew " .. name)
    end
  end)
end

-- Funkcja do uruchamiania z argumentami
local function cargo_run_with_args()
  vim.ui.input({ prompt = "🦀 Argumenty dla cargo run: " }, function(args)
    if args then
      vim.cmd("CargoRun " .. args)
    end
  end)
end

-- Funkcja do uruchamiania w terminalu z argumentami
local function cargo_run_term_with_args()
  vim.ui.input({ prompt = "🦀 Argumenty dla cargo run (terminal): " }, function(args)
    if args then
      vim.cmd("CargoRunTerm " .. args)
    end
  end)
end

wk.add({
  { "<leader>c", group = "🦀 Cargo" },

  -- Podstawowe
  { "<leader>cb", "<cmd>CargoBuild<CR>", desc = "🔨 Buduj" },
  { "<leader>cr", "<cmd>CargoRun<CR>", desc = "▶️ Uruchom" },
  { "<leader>cR", "<cmd>CargoRunTerm<CR>", desc = "🖥️ Uruchom (terminal)" },
  { "<leader>cRa", cargo_run_term_with_args, desc = "🖥️ Uruchom (terminal) z argumentami" },
  { "<leader>ca", cargo_run_with_args, desc = "▶️ Uruchom z argumentami" },
  { "<leader>ct", "<cmd>CargoTest<CR>", desc = "🧪 Testuj" },
  { "<leader>ck", "<cmd>CargoCheck<CR>", desc = "✅ Sprawdź" },
  { "<leader>cl", "<cmd>CargoClippy<CR>", desc = "📎 Clippy" },
  { "<leader>cf", "<cmd>CargoFmt<CR>", desc = "🎨 Formatuj" },
  { "<leader>cx", "<cmd>CargoFix<CR>", desc = "🔧 Napraw" },
  { "<leader>cc", "<cmd>CargoClean<CR>", desc = "🧹 Wyczyść" },
  { "<leader>cB", "<cmd>CargoBench<CR>", desc = "📊 Benchmark" },

  -- Zależności
  { "<leader>cd", group = "📦 Zależności" },
  { "<leader>cda", "<cmd>CargoAdd<CR>", desc = "➕ Dodaj" },
  { "<leader>cdx", "<cmd>CargoRemove<CR>", desc = "➖ Usuń" },
  { "<leader>cdu", "<cmd>CargoUpdate<CR>", desc = "🔄 Aktualizuj" },
  { "<leader>cdo", "<cmd>CargoOutdated<CR>", desc = "⏰ Przestarzałe" },
  { "<leader>cdt", "<cmd>CargoTree<CR>", desc = "🌳 Drzewo" },
  { "<leader>cdA", "<cmd>CargoAudit<CR>", desc = "🔒 Audyt bezpieczeństwa" },
  { "<leader>cdv", "<cmd>CargoVendor<CR>", desc = "📥 Vendor" },

  -- Projekt
  { "<leader>cp", group = "📁 Projekt" },
  { "<leader>cpn", cargo_new, desc = "✨ Nowy projekt" },
  { "<leader>cpd", "<cmd>CargoDoc<CR>", desc = "📚 Dokumentacja" },
  { "<leader>cpp", "<cmd>CargoPublish<CR>", desc = "🚀 Publikuj" },
  { "<leader>cpi", "<cmd>CargoInstall<CR>", desc = "📥 Instaluj" },
  { "<leader>cpu", "<cmd>CargoUninstall<CR>", desc = "🗑️ Odinstaluj" },
  { "<leader>cps", "<cmd>CargoSearch<CR>", desc = "🔍 Szukaj crate" },
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                 WHICH-KEY: RUST-ANALYZER (tylko .rs)                     │
-- └──────────────────────────────────────────────────────────────────────────┘

local function rust_keymaps(bufnr)
  local opts = { buffer = bufnr }
  wk.add({
    { "<leader>cT", function() vim.cmd.RustLsp("testables") end, desc = "🧪 Wybierz test", opts },
    { "<leader>ctn", function() vim.cmd.RustLsp({ "testables", bang = true }) end, desc = "🔁 Powtórz test", opts },
    { "<leader>cD", function() vim.cmd.RustLsp("debuggables") end, desc = "🐛 Debug (wybierz)", opts },
    { "<leader>cdr", function() vim.cmd.RustLsp({ "debuggables", bang = true }) end, desc = "🔁 Powtórz debug", opts },
    { "<leader>cRR", function() vim.cmd.RustLsp("runnables") end, desc = "🏃 Uruchamialne", opts },
    { "gE", function() vim.cmd.RustLsp("explainError") end, desc = "❓ Wyjaśnij błąd (Rust)", opts },
    { "gR", function() vim.cmd.RustLsp("renderDiagnostic") end, desc = "📋 Renderuj diagnostykę", opts },
    { "<leader>ch", function() vim.cmd.RustLsp({ "hover", "actions" }) end, desc = "💬 Akcje hover", opts },
    { "<leader>cm", function() vim.cmd.RustLsp("expandMacro") end, desc = "🔬 Rozwiń makro", opts },
    { "<leader>cj", "<cmd>RustLsp joinLines<CR>", desc = "⛓️ Złącz linie", opts },
    { "<leader>co", function() vim.cmd.RustLsp("openCargo") end, desc = "📄 Otwórz Cargo.toml", opts },
    { "<leader>cP", function() vim.cmd.RustLsp("parentModule") end, desc = "⬆️ Moduł nadrzędny", opts },
  })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(args)
    rust_keymaps(args.buf)
    -- Średnik + nowa linia w Rust
    keymap("i", "<C-CR>", "<Esc>A;<Esc>o", { buffer = args.buf, desc = "Średnik + nowa linia" })
  end,
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                      WHICH-KEY: DEBUGGER (d)                             │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "<leader>d", group = "🐛 Debugger" },
  { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "🔴 Breakpoint" },
  { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Warunek: ")) end, desc = "🟡 Breakpoint warunkowy" },
  { "<leader>dc", function() require("dap").continue() end, desc = "▶️ Kontynuuj/Start" },
  { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "🎯 Do kursora" },
  { "<leader>di", function() require("dap").step_into() end, desc = "⬇️ Wejdź w funkcję" },
  { "<leader>do", function() require("dap").step_over() end, desc = "➡️ Następna linia" },
  { "<leader>dO", function() require("dap").step_out() end, desc = "⬆️ Wyjdź z funkcji" },
  { "<leader>dp", function() require("dap").pause() end, desc = "⏸️ Pauza" },
  { "<leader>dr", function() require("dap").restart() end, desc = "🔄 Restart" },
  { "<leader>dq", function() require("dap").terminate() end, desc = "⏹️ Zakończ" },
  { "<leader>du", function() require("dapui").toggle() end, desc = "🖥️ Panel debuggera" },
  { "<leader>de", function() require("dapui").eval() end, desc = "🔍 Ewaluuj wyrażenie", mode = { "n", "v" } },
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                      WHICH-KEY: TERMINAL (t)                             │
-- └──────────────────────────────────────────────────────────────────────────┘

local Terminal = require("toggleterm.terminal").Terminal

wk.add({
  { "<leader>t", group = "🖥️ Terminal" },

  -- Kierunki otwarcia
  { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
  { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "➖ Terminal poziomy" },
  { "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "➕ Terminal pionowy" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "🪟 Terminal pływający" },
  { "<leader>tT", "<cmd>ToggleTerm direction=tab<CR>", desc = "📑 Terminal w karcie" },

  -- Numerowane terminale (przełączanie)
  { "<leader>t1", "<cmd>1ToggleTerm<CR>", desc = "Terminal 1" },
  { "<leader>t2", "<cmd>2ToggleTerm<CR>", desc = "Terminal 2" },
  { "<leader>t3", "<cmd>3ToggleTerm<CR>", desc = "Terminal 3" },
  { "<leader>t4", "<cmd>4ToggleTerm<CR>", desc = "Terminal 4" },

  -- Operacje
  { "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", desc = "🔄 Toggle wszystkie" },
  { "<leader>ts", "<cmd>TermSelect<CR>", desc = "📋 Wybierz terminal" },
  { "<leader>tn", function()
    vim.ui.input({ prompt = "Nazwa terminala: " }, function(name)
      if name and name ~= "" then
        local term = Terminal:new({ display_name = name })
        term:toggle()
      end
    end)
  end, desc = "✨ Nowy nazwany terminal" },

  -- Wysyłanie do terminala
  { "<leader>tl", "<cmd>ToggleTermSendCurrentLine<CR>", desc = "📤 Wyślij linię" },
  { "<leader>tl", "<cmd>ToggleTermSendVisualLines<CR>", desc = "📤 Wyślij zaznaczenie", mode = "v" },
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                      WHICH-KEY: TROUBLE (x)                              │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "<leader>x", group = "🚦 Diagnostyka" },
  { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostyka (workspace)" },
  { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Diagnostyka (dokument)" },
  { "<leader>xs", "<cmd>Trouble symbols toggle<CR>", desc = "Symbole" },
  { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix" },
  { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Location list" },
  { "<leader>xr", "<cmd>Trouble lsp_references toggle<CR>", desc = "LSP referencje" },
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                    WHICH-KEY: TODO-COMMENTS                              │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "]t", function() require("todo-comments").jump_next() end, desc = "Następne TODO" },
  { "[t", function() require("todo-comments").jump_prev() end, desc = "Poprzednie TODO" },
  { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Lista TODO" },
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                        WHICH-KEY: INNE                                   │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "<leader>n", "<cmd>Neotree toggle position=right<CR>", desc = "📁 Eksplorator plików" },
  { "<leader>?", function() wk.show({ global = true }) end, desc = "⌨️ Wszystkie skróty" },

  -- Sesje (auto-session) - keybindy zdefiniowane w pluginie
  { "<leader>S", group = "💾 Sesje" },

  -- Makra/Rejestry
  { "<leader>M", group = "🎬 Makra" },
  { "<leader>Mr", "<cmd>registers<CR>", desc = "📋 Pokaż rejestry" },
})

-- Markdown keymaps (tylko dla plików .md)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    vim.keymap.set("n", "<leader>m", "<cmd>RenderMarkdown toggle<CR>",
      { buffer = args.buf, desc = "📝 Toggle Markdown preview" })
  end,
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                      WHICH-KEY: PYTHON (p)                               │
-- └──────────────────────────────────────────────────────────────────────────┘

local function python_keymaps(bufnr)
  local opts = { buffer = bufnr }
  wk.add({
    { "<leader>p", group = "🐍 Python", opts },

    -- Venv (klucz zdefiniowany w pluginie venv-selector)
    { "<leader>pv", "<cmd>VenvSelect<CR>", desc = "🌐 Wybierz venv", opts },

    -- Testy (neotest)
    { "<leader>pt", group = "🧪 Testy", opts },
    { "<leader>ptt", function() require("neotest").run.run() end, desc = "Uruchom najbliższy test", opts },
    { "<leader>ptf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Uruchom testy w pliku", opts },
    { "<leader>pts", function() require("neotest").summary.toggle() end, desc = "Podsumowanie testów", opts },
    { "<leader>pto", function() require("neotest").output.open({ enter = true }) end, desc = "Wyjście testu", opts },
    { "<leader>ptS", function() require("neotest").run.stop() end, desc = "Zatrzymaj testy", opts },

    -- Debug (nvim-dap-python)
    { "<leader>pd", group = "🐛 Debug", opts },
    { "<leader>pdm", function() require("dap-python").test_method() end, desc = "Debug: metoda", opts },
    { "<leader>pdc", function() require("dap-python").test_class() end, desc = "Debug: klasa", opts },
    { "<leader>pds", function() require("dap-python").debug_selection() end, desc = "Debug: zaznaczenie", mode = "v", opts },

    -- Akcje kodu (LSP)
    { "<leader>po", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
      })
    end, desc = "📦 Organize imports", opts },

    { "<leader>pf", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll" } },
        apply = true,
      })
    end, desc = "🔧 Fix all (Ruff)", opts },
  })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    python_keymaps(args.buf)
  end,
})
