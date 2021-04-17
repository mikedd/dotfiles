local cmd = vim.api.nvim_command
cmd("syntax on")
cmd("filetype plugin indent on")

require "plugins"
require "options"
require "config"

-- " DBExt
-- source $HOME/.psql.vim

--     " Instead of reverting the cursor to the last position in the buffer, we
--     " set it to the first line when editing a git commit message
--     au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0]

--     " Filetypes
--     " gradle syntax highlighting
--     au BufNewFile,BufRead *.gradle set filetype=groovy
--     " markdown  highlighting
--     au BufNewFile,BufRead *.md set filetype=markdown

    -- " Remove trailing whitespace
    -- autocmd FileType c,cpp,javscript autocmd BufWritePre <buffer> :%s/\s\+$//e"
    -- nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
-- " }}}
