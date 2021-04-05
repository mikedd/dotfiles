local base = os.getenv("HOME") .. "/.vim"

vim.api.nvim_set_option('backupdir', base .. '/backup')
vim.api.nvim_set_option('viewdir', base .. '/views')
vim.api.nvim_set_option('directory', base .. '/swap')
vim.api.nvim_set_option('undodir', base .. '/undo')
