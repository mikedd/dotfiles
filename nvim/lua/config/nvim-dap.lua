require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

-- Do this for python files only
-- require('dap-python').test_runner = 'pytest'
--
--MIKE: Look into whether we need to use buffer local settings
-- local set_keymap = vim.api.nvim_buf_set_keymap
local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local cmd_dap = '<cmd>lua require("dap")'

vim.fn.sign_define('DapBreakpoint',
                   {text = '🟥', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',
                   {text = '🟢', texthl = '', linehl = '', numhl = ''})

set_keymap('n', '<leader>k' , cmd_dap .. '.continue()<CR>', opts)
set_keymap('n', '<leader>j', cmd_dap .. '.step_over()<CR>', opts)
set_keymap('n', '<leader>l', cmd_dap .. '.step_into()<CR>', opts)
set_keymap('n', '<leader>h', cmd_dap .. '.step_out()<CR>', opts)

set_keymap('n', '<leader>b', cmd_dap .. '.toggle_breakpoint()<CR>', opts)
set_keymap('n', '<leader>B', cmd_dap .. '.set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
set_keymap('n', '<leader>lp', cmd_dap .. '.set_breakpoint(nil, nil,  vim.fn.input("Log point message: "))<CR>', opts)

set_keymap('n', '<leader>dr', cmd_dap .. '.repl_openb()<CR>', opts)
set_keymap('n', '<leader>dl', cmd_dap .. '.run_last()<CR>', opts)
set_keymap('n', '<leader>ds', cmd_dap .. '.continue()<CR>', opts)
set_keymap('n', '<leader>dr', cmd_dap .. '.repl_open({}, "vsplit")<CR><C-w>l', opts)
set_keymap('n', '<leader>di', '<cmd>lua require("dap.ui.variables").visual_hover()<CR>', opts)
set_keymap('n', '<leader>d?', '<cmd>lua require("dap.ui.variables").scopes()<CR>', opts)

-- From nvim-dap-virtual-text
vim.api.nvim_set_var('dap_virtual_text', true)
