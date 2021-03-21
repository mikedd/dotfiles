local base = os.getenv("HOME") .. "/.vim"

vim.api.nvim_set_var('backupdir', base .. '/backup')
vim.api.nvim_set_var('viewdir', base .. '/views')
vim.api.nvim_set_var('directory', base .. '/swap')
vim.api.nvim_set_var('undodir', base .. '/undo')
