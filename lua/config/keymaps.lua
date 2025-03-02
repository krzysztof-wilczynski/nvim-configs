local map = vim.keymap

map.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear highlights on search when pressing <Esc> in normal mode

map.set('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Open diagnostic [Q]uickfix list'})

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
