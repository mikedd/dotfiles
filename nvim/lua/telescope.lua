local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap=true }

set_keymap('n', '<c-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)
set_keymap('n', '<leader>fq', [[<cmd>lua require('telescope.builtin').quickfix()<cr>]], opts)

-- " Configuration for telescope
-- nnoremap <leader>ff <cmd>Telescope find_files<cr>
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
-- nnoremap <leader>fq <cmd>Telescope quickfix<cr>
