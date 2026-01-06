return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0", -- lub '*' dla najnowszego wydania
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    -- Automatyczny zapis po wyjściu z insert mode lub zmianie tekstu
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
      defer_save = { "InsertLeave", "TextChanged" },
      cancel_deferred_save = { "InsertEnter" },
    },
    debounce_delay = 1000,     -- ms, opóźnienie zapisu po zmianie
    condition = nil,           -- możesz dodać własny warunek, np. nie zapisuj dla niektórych filetype
    write_all_buffers = false, -- domyślnie zapisuje tylko bieżący bufor
  },
  cmd = "ASToggle",            -- komenda do ręcznego włączania/wyłączania
}
