local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}
local cmd_ts = '<cmd>lua require("telescope.builtin")'

set_keymap('n', '<c-p>', cmd_ts .. '.find_files({hidden = true})<cr>', opts)
set_keymap('n', '<leader>ff', cmd_ts .. '.find_files({hidden = true})<cr>', opts)
set_keymap('n', '<leader>fg', cmd_ts .. '.live_grep({hidden = true})<cr>', opts)
set_keymap('n', '<leader>fb', cmd_ts .. '.buffers()<cr>', opts)
set_keymap('n', '<leader>fh', cmd_ts .. '.help_tags()<cr>', opts)
set_keymap('n', '<leader>fq', cmd_ts .. '.quickfix()<cr>', opts)
set_keymap('n', '<leader>fch', cmd_ts .. '.command_history()<cr>', opts)
set_keymap('n', '<leader>fo', cmd_ts .. '.oldfiles()<cr>', opts)
set_keymap('n', '<leader>fC', cmd_ts .. '.commands()<cr>', opts)

-- lsp
set_keymap('n', '<leader>fr', cmd_ts .. '.lsp_references()<cr>', opts)
set_keymap('n', '<leader>fa', cmd_ts .. '.lsp_code_actions()<cr>', opts)
set_keymap('n', '<leader>fd', cmd_ts .. '.lsp_document_diagnostics()<cr>', opts)
set_keymap('n', '<leader>fs', cmd_ts .. '.lsp_document_symbols()<cr>', opts)
set_keymap('n', '<leader>fw', cmd_ts .. '.lsp_workspace_symbols()<cr>', opts)
set_keymap('n', '<leader>fe', cmd_ts .. '.lsp_workspace_diagnostics()<cr>', opts)
set_keymap('n', '<leader>fD', cmd_ts .. '.lsp_definitions()<cr>', opts)

-- git
set_keymap('n', '<leader>fh', cmd_ts .. '.git_status()<cr>', opts)
set_keymap('n', '<leader>fj', cmd_ts .. '.git_branches()<cr>', opts)
set_keymap('n', '<leader>fc', cmd_ts .. '.git_commits()<cr>', opts)

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
