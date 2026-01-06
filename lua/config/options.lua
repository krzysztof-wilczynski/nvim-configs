vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Clipboard dla Wayland
if os.getenv("WAYLAND_DISPLAY") then
  vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = "wl-copy",
      ["*"] = "wl-copy",
    },
    paste = {
      ["+"] = "wl-paste --no-newline",
      ["*"] = "wl-paste --no-newline",
    },
    cache_enabled = 1,
  }
end

local is_gui = vim.g.neovide or vim.g.goneovim

-- PODSTAWOWE USTAWIENIA WYŚWIETLANIA
local options = {
  number = true,          -- Pokazuj numery linii
  relativenumber = false, -- Nie pokazuj względnych numerów linii
  cursorline = true,      -- Podświetlaj bieżącą linię
  signcolumn = "yes",     -- Jedna kolumna znaków diagnostycznych
  colorcolumn = "120",    -- Pionowa linia przy 100 znaku
  wrap = false,           -- Nie zawijaj długich linii
  scrolloff = 8,          -- Margines pionowy przy przewijaniu
  sidescrolloff = 8,      -- Margines poziomy przy przewijaniu
  laststatus = 3,         -- Globalny statusline
  showmode = false,       -- Nie pokazuj trybu (INSERT itp.)
  showtabline = 1,        -- Pasek tabów tylko gdy jest więcej niż jeden

  -- KOLORY I UI
  termguicolors = true, -- Pełna paleta kolorów
  cmdheight = 0,        -- Więcej miejsca na wiadomości

  -- MYSZ, SCHOWEK, KLAWISZE
  mouse = "a",                       -- Myszka we wszystkich trybach
  clipboard = "unnamed,unnamedplus", -- Systemowy schowek
  pumheight = 10,                    -- Maks. 10 pozycji w menu podpowiedzi

  -- TABULATORY I WCIĘCIA
  tabstop = 2,        -- Tab = 2 spacje
  shiftwidth = 2,     -- Wcięcie = 2 spacje
  softtabstop = 2,    -- Tab w trybie insert = 2 spacje
  expandtab = true,   -- Zamieniaj tabulatory na spacje
  smartindent = true, -- Inteligentne wcięcia
  smarttab = true,    -- Sprytne taby
  autoindent = true,  -- Automatyczne wcięcia

  -- WYSZUKIWANIE
  ignorecase = true, -- Ignoruj wielkość liter
  smartcase = true,  -- Uwzględnij wielkość liter, jeśli jest w zapytaniu
  incsearch = true,  -- Wyniki podczas wpisywania
  hlsearch = true,   -- Podświetl wszystkie wyniki

  -- PLIKI, HISTORIA, BACKUP
  undofile = true,     -- Trwała historia cofania
  swapfile = false,    -- Wyłącz pliki swap
  backup = false,      -- Wyłącz backupy
  writebackup = false, -- Wyłącz backup przy zapisie
  viminfo = "'1000",   -- Większa historia plików

  -- WYDAJNOŚĆ I KOMFORT
  updatetime = 100,                -- Szybsze odświeżanie (ms)
  timeoutlen = 200,                -- Krótszy czas oczekiwania na mapowanie
  wildignore = "*node_modules/**", -- Ignoruj node_modules w wyszukiwaniu

  -- INNE
  spelllang = { "en", "pl" }, -- Języki sprawdzania pisowni
  foldcolumn = "0",
  foldnestmax = 0,
  foldlevel = 99,
  foldlevelstart = 99,
  conceallevel = 2, -- Ukrywaj tekst (np. tailwind)
  concealcursor = "",
  encoding = "utf-8",
  fileencoding = "utf-8",
  errorbells = false, -- Brak dźwięków przy błędach
  emoji = false,      -- Wyłącz emoji
  backspace = "indent,eol,start",
}

-- USTAWIENIA SPECYFICZNE DLA GUI
if is_gui then
  options.guifont = "FiraCode Nerd Font:h12" -- Czcionka dla GUI
  options.linespace = 2
  vim.g.neovide_cursor_vfx_mode = "railgun"  -- Efekt kursora w Neovide
  vim.cmd.colorscheme("catppuccin-mocha")    -- Fancy motyw kolorystyczny
else
  options.guifont = nil
  options.termguicolors = true -- Możesz ustawić na false jeśli Twój terminal nie obsługuje TrueColor
  -- vim.cmd.colorscheme("gruvbox") -- Możesz wymusić prostszy motyw
end

-- USTAWIENIA GLOBALNE
vim.g.markdown_recommended_style = 0

-- ZASTOSUJ WSZYSTKIE OPCJE
for k, v in pairs(options) do
  pcall(function() vim.opt[k] = v end)
end

-- DIAGNOSTYKA (błędy LSP)
vim.diagnostic.config({
  virtual_text = false,     -- true = tekst błędu na końcu linii
  float = {
    border = "rounded",
    source = true,          -- pokaż źródło błędu (np. "rust-analyzer")
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Automatyczne pokazywanie błędu przy zatrzymaniu kursora (opcjonalne)
-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false })
--   end,
-- })

-- Auto-fix błędów przy zapisie (opcjonalne - odkomentuj jeśli chcesz)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function()
--     vim.lsp.buf.code_action({
--       context = { only = { "source.fixAll" } },
--       apply = true,
--     })
--   end,
-- })
