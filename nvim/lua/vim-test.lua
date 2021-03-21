vim.api.nvim_set_keymap("n", "tt", ":TestNearest<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tf", ":TestFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ts", ":TestSuite<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tl", ":TestLast<CR>", { noremap = true, silent = true })

vim.api.nvim_set_var('test#strategy', 'neovim')
vim.api.nvim_set_var('test#neovim#term_position', 'vertical')

-- map <C-\><C-n> (allows you to edit the output window) to something easier to hit.
-- <C-o> will let you scroll through test errors
vim.api.nvim_set_keymap("t", "<C-o>", "<C-\\><C-n>", {})
