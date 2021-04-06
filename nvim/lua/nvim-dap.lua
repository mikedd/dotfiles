require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

-- Do this for python files only
-- require('dap-python').test_runner = 'pytest'

vim.fn.sign_define('DapBreakpoint',
                   {text = '🟥', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',
                   {text = '🟢', texthl = '', linehl = '', numhl = ''})

vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>lua require("dap").continue()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>j', '<cmd>lua require("dap").step_over()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>lua require("dap").step_into()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua require("dap").step_out()<CR>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>b',
                        '<cmd>lua require("dap").toggle_breakpoint()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>B',
                        '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>lp',
                        '<cmd>lua require("dap").set_breakpoint(nil, nil,  vim.fn.input("Log point message: "))<CR>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>dr',
                        '<cmd>lua require("dap").repl_openb()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require("dap").run_last()<CR>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>lua require("dap").continue()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dr',
                        '<cmd>lua require("dap").repl_open({}, "vsplit")<CR><C-w>l',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>di',
                        '<cmd>lua require("dap.ui.variables").visual_hover()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>d?',
                        '<cmd>lua require("dap.ui.variables").scopes()<CR>',
                        {noremap = true, silent = true})

-- From nvim-dap-virtual-text
vim.api.nvim_set_var('dap_virtual_text', true)
