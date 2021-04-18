local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap=true }
local cmd = vim.api.nvim_command
cmd("syntax on")
cmd("filetype plugin indent on")

require "plugins"
require "options"
require "config"


set_keymap('n', '<F5>', [[<cmd>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>]], opts)

    -- " Remove trailing whitespace
    -- autocmd FileType c,cpp,javscript autocmd BufWritePre <buffer> :%s/\s\+$//e"
    -- nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
-- " }}}
