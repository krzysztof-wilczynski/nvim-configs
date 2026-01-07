-- Wykrywanie srodowiska: GUI / terminal z Nerd Font / minimal (TTY/SSH)

local M = {}

-- Sprawdz czy uruchomiono w GUI (Neovide, GoNeovim, itp.)
function M.is_gui()
  return vim.g.neovide or vim.g.goneovim or vim.fn.has("gui_running") == 1
end

-- Sprawdz czy terminal wspiera Nerd Font (lista znanych terminali)
function M.has_nerd_font()
  local rich_terminals = {
    "wezterm",
    "alacritty",
    "iterm.app",
    "kitty",
    "hyper",
    "tabby",
    "foot",
    "rio",
    "ghostty",
    "contour",
    "warp",
  }

  local term_program = (vim.env.TERM_PROGRAM or ""):lower()
  local wezterm_exe = vim.env.WEZTERM_EXECUTABLE ~= nil

  -- WezTerm ustawia WEZTERM_EXECUTABLE
  if wezterm_exe then
    return true
  end

  for _, t in ipairs(rich_terminals) do
    if term_program:find(t, 1, true) then
      return true
    end
  end

  return false
end

-- Sprawdz czy tryb minimal (TTY, SSH, brak wsparcia dla ikon)
function M.is_minimal()
  -- Reczne wymuszenie przez zmienna srodowiskowa
  if vim.env.NVIM_MINIMAL == "1" then
    return true
  end

  -- Reczne wymuszenie przez toggle
  if vim.g.force_minimal then
    return true
  end

  -- TTY (konsola linuxowa bez X/Wayland)
  if vim.env.TERM == "linux" then
    return true
  end

  -- SSH bez GUI
  if vim.env.SSH_CONNECTION and not M.is_gui() then
    return true
  end

  -- Brak wsparcia dla Nerd Font i nie GUI
  if not M.is_gui() and not M.has_nerd_font() then
    return true
  end

  return false
end

-- Sprawdz czy tryb rich (pelne ikony)
function M.is_rich()
  return not M.is_minimal()
end

-- Przelacz miedzy trybami (wymaga restartu dla pelnego efektu)
function M.toggle()
  vim.g.force_minimal = not vim.g.force_minimal
  local mode = M.is_minimal() and "minimal" or "rich"
  vim.notify("Tryb: " .. mode .. " (zrestartuj nvim dla pelnego efektu)", vim.log.levels.INFO)
end

-- Komenda :ToggleMinimal
vim.api.nvim_create_user_command("ToggleMinimal", M.toggle, {
  desc = "Przelacz miedzy trybem rich a minimal",
})

-- Helper do warunkowych opisow (emoji w rich, tekst w minimal)
function M.desc(icon, text)
  if M.is_rich() then
    return icon .. " " .. text
  end
  return text
end

return M
