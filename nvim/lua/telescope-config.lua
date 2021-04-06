local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap=true }

set_keymap('n', '<c-p>', [[<cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>]], opts)
set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>]], opts)
set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep({hidden = true})<cr>]], opts)
set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)
set_keymap('n', '<leader>fq', [[<cmd>lua require('telescope.builtin').quickfix()<cr>]], opts)

-- lsp
set_keymap('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], opts)
set_keymap('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>]], opts)
set_keymap('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>]], opts)
set_keymap('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]], opts)
