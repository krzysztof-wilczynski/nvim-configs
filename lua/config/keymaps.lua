local keymap = vim.keymap.set
local silent = { silent = true }

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear highlights on search when pressing <Esc> in normal mode

keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Otwórz diagnostykę" })

-- Disable arrow keys in normal mode
keymap("n", "<left>", '<cmd>echo "Use h"<CR>')
keymap("n", "<right>", '<cmd>echo "Use l"<CR>')
keymap("n", "<up>", '<cmd>echo "Use k"<CR>')
keymap("n", "<down>", '<cmd>echo "Use j"<CR>')

-- Keybinds to make split navigation easier.
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Wcięcia
keymap("n", "<", "<gv", { desc = "Zmniejsz wcięcie" })
keymap("v", "<", "<gv", { desc = "Zmniejsz wcięcie" })
keymap("n", ">", ">gv", { desc = "Zwiększ wcięcie" })
keymap("v", ">", ">gv", { desc = "Zwiększ wcięcie" })

-- windows
keymap("n", "<leader>ww", "<C-W>s", { desc = "Podziel okno w pionie", remap = true })
keymap("n", "<leader>wh", "<C-W>v", { desc = "Podziel okno w poziomie", remap = true })
keymap("n", "<leader>wq", "<C-W>c", { desc = "Usuń okno", remap = true })

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- tabs
keymap("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Ostatnia karta" })
keymap("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Zamknij inne karty" })
keymap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "Pierwsza karta" })
keymap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Nowa karta" })
keymap("n", "<leader><tab>e", "<cmd>tabnext<cr>", { desc = "Następna karta" })
keymap("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Zamknij kartę" })
keymap("n", "<leader><tab>q", "<cmd>tabprevious<cr>", { desc = "Poprzednia karta" })

keymap("n", "<F10>", ":Dbee toggle<CR>", { desc = "Otwórz konektor DB" })
keymap("n", "<leader>oc", ":CsvViewToggle<CR>", { desc = "Otwórz podgląd CSV" })

-- Zapisywanie Ctrl+S
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Wychodzenie
-- keymap("n", "<leader>qq", ":qall<CR>", { desc = "Wyjdź" })
-- keymap("n", "<leader>qQ", ":qall!<CR>", { desc = "Wyjdź bez zapisywania" })
-- keymap("n", "<leader>qs", ":source %<CR>", { desc = "Przeładuj plik" })

-- Don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)

keymap("n", "<leader>ca", vim.lsp.buf.code_action, {noremap=true, silent=true})

-- Adjust font size
keymap("n", "<C-=>", function() require('utils').adjust_font_size(1) end, silent)
keymap("n", "<C-->", function() require('utils').adjust_font_size(-1) end, silent)
