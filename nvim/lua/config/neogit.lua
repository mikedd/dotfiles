local set_keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

set_keymap('n', '<leader>gs',
           '<cmd>lua require("neogit").open({ kind="split" })<CR>', opts)
set_keymap('n', '<leader>gc',
           '<cmd>lua require("neogit").open({ "commit" })<CR>', opts)
set_keymap('n', '<leader>gp',
           '<cmd>lua require("neogit").open({ "push" })<CR>', opts)
set_keymap('n', '<leader>gp',
           '<cmd>lua require("neogit").open({ "branch" })<CR>', opts)

set_keymap('n', '<leader>gp',
           '<cmd>lua require("neogit").open({ "log" })<CR>', opts)
