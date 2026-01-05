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
  { "<leader>ca", vim.lsp.buf.code_action, desc = "💡 Akcja kodu" },
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

wk.add({
  { "<leader>c", group = "🦀 Cargo" },

  -- Podstawowe
  { "<leader>cb", "<cmd>CargoBuild<CR>", desc = "🔨 Buduj" },
  { "<leader>cr", "<cmd>CargoRun<CR>", desc = "▶️ Uruchom" },
  { "<leader>cR", "<cmd>CargoRunTerm<CR>", desc = "🖥️ Uruchom (terminal)" },
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
    { "<leader>ce", function() vim.cmd.RustLsp("explainError") end, desc = "❓ Wyjaśnij błąd", opts },
    { "<leader>cE", function() vim.cmd.RustLsp("renderDiagnostic") end, desc = "📋 Diagnostyka", opts },
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
-- │                        WHICH-KEY: INNE                                   │
-- └──────────────────────────────────────────────────────────────────────────┘

wk.add({
  { "<leader>n", "<cmd>Neotree toggle position=right<CR>", desc = "📁 Eksplorator plików" },
  { "<leader>?", function() wk.show({ global = true }) end, desc = "⌨️ Wszystkie skróty" },
})
