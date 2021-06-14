local home_dir = os.getenv("HOME")
local vim_dir = home_dir .. "/.vim"
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

local shortmess = vim.api.nvim_get_option('shortmess') .. "c"
vim.o.shortmess = shortmess -- +="c"

-- set diffopt+=internal,algorithm:patience
-- vim.api.nvim_set_var('diffopt', vim.api.nvim_get_var('diffopt') .. 'internal,algorithm:patience')
-- vim.o.diffopt = 'internal,filler,closeoff,algorithm:patience'

vim.o.showmatch = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.undolevels = 1000

-- backup
vim.o.backupdir = vim_dir .. '/backup'
vim.o.viewdir = vim_dir .. '/views'
vim.o.directory = vim_dir .. '/swap'
vim.o.undodir = vim_dir .. '/undo'

-- these appear to affect only the first buffer
vim.bo.autoindent = true
vim.bo.complete = '.,w,b,u,t,i'
vim.bo.expandtab = true
vim.bo.fixendofline = false
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4
vim.bo.undofile = true

-- so redo them as non buffer options
vim.o.autoindent = true
vim.o.complete = '.,w,b,u,t,i'
vim.o.expandtab = true
vim.o.fixendofline = false
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.undofile = true

-- window options
vim.wo.cursorline = true
vim.wo.list = true
vim.wo.number = true

--- not options - global vars
vim.g.mapleader = ','
vim.g.markdown_fenced_languages = {'javascript', 'js=javascript', 'json=javascript', 'python', 'sql'}
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3 -- tree style listing

vim.g.python_host_prog = home_dir .. '/.pyenv/versions/2.7.18/bin/python'
vim.g.python3_host_prog = home_dir .. '/.pyenv/versions/3.9.4/bin/python'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
