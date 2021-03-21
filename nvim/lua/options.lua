-- vim.api.nvim_set_option('is shorthand for vim.api.nvim_set_option
-- vim.api.nvim_buf_set_option('is shorthand for vim.api.nvim_buf_set_option
-- vim.api.nvim_win_set_option('is shorthand for vim.api.nvim_win_set_option

-- global options
vim.api.nvim_set_option('background', 'dark')
vim.api.nvim_set_option('backspace', 'indent,eol,start')
vim.api.nvim_set_option('backup', true)
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.api.nvim_set_option('completeopt', 'menuone,noinsert,noselect') -- from devOnDuty and nvim-lua/completion-nvim
vim.api.nvim_set_option('cmdheight', 1)
vim.api.nvim_set_option('hidden', true)
vim.api.nvim_set_option('history', 1000)
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('listchars', 'tab:› ,trail:•,extends:#,nbsp:.')
vim.api.nvim_set_option('pastetoggle', '<F12>')

local shortmess = vim.api.nvim_get_option('shortmess') .. "c"
vim.api.nvim_set_option('shortmess', shortmess) -- +="c"

vim.api.nvim_set_option('showmatch', true)
vim.api.nvim_set_option('smartcase', true)
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('undolevels', 1000)

-- buffer options
vim.api.nvim_buf_set_option(0, 'autoindent', true)
vim.api.nvim_buf_set_option(0, 'complete', '.,w,b,u,t,i')
vim.api.nvim_buf_set_option(0, 'expandtab', true)
vim.api.nvim_buf_set_option(0, 'fixendofline', false)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 4)
vim.api.nvim_buf_set_option(0, 'softtabstop', 4)
vim.api.nvim_buf_set_option(0, 'tabstop', 4)
vim.api.nvim_buf_set_option(0, 'undofile', true)

-- window options
vim.api.nvim_win_set_option(0, 'cursorline', true)
vim.api.nvim_win_set_option(0, 'list', true)
vim.api.nvim_win_set_option(0, 'number', true)

--- not options - global vars
vim.api.nvim_set_var('mapleader', ',')
vim.api.nvim_set_var('markdown_fenced_languages', {'javascript', 'js=javascript', 'json=javascript', 'python', 'sql'})
vim.api.nvim_set_var('netrw_banner', false)
vim.api.nvim_set_var('netrw_liststyle', 3) -- tree style listing
vim.api.nvim_set_var('python_host_prog', '/home/mike/.pyenv/versions/2.7.18/bin/python')
vim.api.nvim_set_var('python3_host_prog', '/home/mike/.pyenv/versions/3.8.5/bin/python')
