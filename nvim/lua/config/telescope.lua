local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}
local cmd_ts = '<cmd>lua require("telescope.builtin")'

set_keymap('n', '<c-p>', cmd_ts .. '.find_files({hidden = true})<cr>', opts)
set_keymap('n', '<leader>ff', cmd_ts .. '.find_files({hidden = true})<cr>', opts)
set_keymap('n', '<leader>fg', cmd_ts .. '.live_grep({hidden = true})<cr>', opts)
set_keymap('n', '<leader>fb', cmd_ts .. '.buffers()<cr>', opts)
set_keymap('n', '<leader>fh', cmd_ts .. '.help_tags()<cr>', opts)
set_keymap('n', '<leader>fq', cmd_ts .. '.quickfix()<cr>', opts)

-- lsp
set_keymap('n', '<leader>fr', cmd_ts .. '.lsp_references()<cr>', opts)
set_keymap('n', '<leader>fa', cmd_ts .. '.lsp_code_actions()<cr>', opts)
set_keymap('n', '<leader>fd', cmd_ts .. '.lsp_document_diagnostics()<cr>', opts)
set_keymap('n', '<leader>fs', cmd_ts .. '.lsp_document_symbols()<cr>', opts)
