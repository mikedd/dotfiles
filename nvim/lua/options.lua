-- vim.o is shorthand for vim.api.nvim_set_option
-- vim.bo is shorthand for vim.api.nvim_buf_set_option
-- vim.wo is shorthand for vim.api.nvim_win_set_option

-- global options
vim.o.background = 'dark'
vim.o.backspace = 'indent,eol,start'
vim.o.backup = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noinsert,noselect' -- from devOnDuty and nvim-lua/completion-nvim
vim.o.cmdheight = 1
vim.o.hidden = true
vim.o.history = 1000
vim.o.ignorecase = true
vim.o.listchars = 'tab:› ,trail:•,extends:#,nbsp:.'
vim.o.pastetoggle = '<F12>'
vim.o.shortmess = vim.o.shortmess .. "c" -- +="c"
vim.o.showmatch = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.undolevels = 1000

-- buffer options
vim.bo.autoindent = true
vim.bo.complete = '.,w,b,u,t,i'
vim.bo.expandtab = true
vim.bo.fixendofline = false
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4
vim.bo.undofile = true

-- window options
vim.wo.cursorline = true
vim.wo.list = true
vim.wo.number = true

--- not options - global vars
vim.api.nvim_set_var('mapleader', ',')
vim.api.nvim_set_var('markdown_fenced_languages', {'javascript', 'js=javascript', 'json=javascript', 'python', 'sql'})
vim.api.nvim_set_var('netrw_banner', false)
vim.api.nvim_set_var('netrw_liststyle', 3) -- tree style listing
vim.api.nvim_set_var('python_host_prog', '/home/mike/.pyenv/versions/2.7.18/bin/python')
vim.api.nvim_set_var('python3_host_prog', '/home/mike/.pyenv/versions/3.8.5/bin/python')
