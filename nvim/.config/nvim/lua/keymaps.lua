local map = vim.api.nvim_set_keymap
local default_options = {noremap = true, silent = true}

map('', '<up>', '', default_options)
map('', '<right>', '', default_options)
map('', '<down>', '', default_options)
map('', '<left>', '', default_options)

map('n', ',<space>', ':nohlsearch<CR>', default_options)

map('n', '<C-n>', ':NvimTreeToggle<CR>', default_options)
map('n', '<C-m>', ':NvimTreeFocus<CR>', default_options)
