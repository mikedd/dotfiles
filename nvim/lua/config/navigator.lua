require('Navigator').setup()

local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set_keymap('n', '<C-h>', '<cmd>lua require("Navigator").left()<CR>', opts)
set_keymap('n', '<C-l>', '<cmd>lua require("Navigator").right()<CR>', opts)
set_keymap('n', '<C-k>', '<cmd>lua require("Navigator").up()<CR>', opts)
set_keymap('n', '<C-j>', '<cmd>lua require("Navigator").down()<CR>', opts)
