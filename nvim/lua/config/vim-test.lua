vim.api.nvim_set_keymap("n", "tt", ":TestNearest<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tf", ":TestFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ts", ":TestSuite<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tl", ":TestLast<CR>", { noremap = true, silent = true })

vim.api.nvim_set_var('test#strategy', 'neovim')
vim.api.nvim_set_var('test#neovim#term_position', 'vertical')

-- map <C-\><C-n> (allows you to edit the output window) to something easier to hit.
-- <C-o> will let you scroll through test errors
vim.api.nvim_set_keymap("t", "<C-o>", "<C-\\><C-n>", {})


-- For javascript testing
-- let g:test#javascript#runner=jest
-- vim.api.nvim_set_var('test#javascript#runner','jest')

-- outreach karma tests need to point to our karma config???
--let test#ruby#minitest#options = '--verbose'
vim.api.nvim_set_var('test#javascript#karma#options', 'aledade/tests/js/karma.conf.js --browsers ChromeHeadlessNoSandbox ' )
