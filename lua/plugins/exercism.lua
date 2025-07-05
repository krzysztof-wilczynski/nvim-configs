-- plugins/exercism.lua
return {
  '2kabhishek/exercism.nvim',
  cmd = {
    'ExercismLanguages',
    'ExercismList',
    'ExercismSubmit',
    'ExercismTest',
  },
  keys = {
    { '<leader>exa', '<cmd>ExercismLanguages<CR>', desc = 'Exercism: List languages' },
    { '<leader>exl', '<cmd>ExercismList<CR>',      desc = 'Exercism: List exercises' },
    { '<leader>exs', '<cmd>ExercismSubmit<CR>',    desc = 'Exercism: Submit exercise' },
    { '<leader>ext', '<cmd>ExercismTest<CR>',      desc = 'Exercism: Run tests' },
  },
  dependencies = {
    '2kabhishek/utils.nvim', -- wymagane
  },
  opts = {
    exercism_workspace = '~/exercism', -- domyślny katalog na ćwiczenia
    default_language = 'rust', -- domyślny język
    add_default_keybindings = true, -- domyślne skróty klawiszowe
    icons = {
      concept = '', -- ikona dla ćwiczeń koncepcyjnych
      practice = '', -- ikona dla ćwiczeń praktycznych
    },
  },
}
