local map = vim.keymap

map.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear highlights on search when pressing <Esc> in normal mode

map.set('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Open diagnostic [Q]uickfix list'})

-- Disable arrow keys in normal mode
map.set('n', '<left>', '<cmd>echo "Use h"<CR>')
map.set('n', '<right>', '<cmd>echo "Use l"<CR>')
map.set('n', '<up>', '<cmd>echo "Use k"<CR>')
map.set('n', '<down>', '<cmd>echo "Use j"<CR>')

-- Keybinds to make split navigation easier.
map.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Wcięcia
map.set('n', '<' ,'<gv', { desc = "Zmniejsz wcięcie" })
map.set('v', '<' ,'<gv', { desc = "Zmniejsz wcięcie" })
map.set('n', '>' ,'>gv', { desc = "Zwiększ wcięcie" })
map.set('v', '>' ,'>gv', { desc = "Zwiększ wcięcie" })

-- windows
map.set("n", "<leader>ww", "<C-W>s", { desc = "Podziel okno w pionie", remap = true })
map.set("n", "<leader>wh", "<C-W>v", { desc = "Podziel okno w poziomie", remap = true })
map.set("n", "<leader>wq", "<C-W>c", { desc = "Usuń okno", remap = true })

-- tabs
map.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Ostatnia karta" })
map.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Zamknij inne karty" })
map.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "Pierwsza karta" })
map.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Nowa karta" })
map.set("n", "<leader><tab>e", "<cmd>tabnext<cr>", { desc = "Następna karta" })
map.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Zamknij kartę" })
map.set("n", "<leader><tab>q", "<cmd>tabprevious<cr>", { desc = "Poprzednia karta" })

map.set('n', "<F10>", ":Dbee toggle<CR>", { desc = "Otwórz konektor DB"})
