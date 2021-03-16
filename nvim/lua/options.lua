-- vim.o is shorthand for vim.api.nvim_set_option
-- vim.bo is shorthand for vim.api.nvim_buf_set_option
-- vim.wo is shorthand for vim.api.nvim_win_set_option

-- global options
vim.o.backspace = 'indent,eol,start'
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noinsert,noselect' -- from devOnDuty and nvim-lua/completion-nvim
vim.o.cmdheight = 1
vim.o.hidden = true
vim.o.history = 1000
vim.o.ignorecase = true
-- vim.o.listchars = 'tab:›\ ,trail:•,extends:#,nbsp:.'
-- vim.o.pastetoggle = <F12> 
vim.o.shortmess = vim.o.shortmess .. "c" -- string concat
vim.o.showmatch = true
vim.o.smartcase = true

-- buffer options
vim.bo.autoindent = true
vim.bo.complete = '.,w,b,u,t,i'
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4

-- window options
vim.wo.cursorline = true
vim.wo.list = true
vim.wo.number = true
