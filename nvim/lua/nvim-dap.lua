require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

-- Do this for python files only
-- require('dap-python').test_runner = 'pytest'

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

vim.api.nvim_set_keymap('n', '<S-g>', ':lua require("dap").continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-j>', ':lua require("dap").step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-l>', ':lua require("dap").step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':lua require("dap").step_out()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil,  vim.fn.input("Log point message: "))<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl_openb()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ds', ':lua require("dap").continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl_open({}, "vsplit")<CR><C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>di', ':lua require("dap.ui.variables").visual_hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d?', ':lua require("dap.ui.variables").scopes()<CR>', { noremap = true, silent = true })

-- From help dap.txt
-- nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
-- nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
-- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

-- From nvim-dap-virtual-text
vim.api.nvim_set_var('dap_virtual_text', true)
