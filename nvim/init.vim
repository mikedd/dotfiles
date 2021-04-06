filetype plugin indent on

lua require("plugins")
lua require('options')

" DBExt
" source $HOME/.psql.vim

lua require('treesitter')
lua require('nvim-compe')
lua require('lsp-config')
lua require('telescope-config')
lua require('vim-test')
lua require('neoformat')
lua require('ale')
lua require('editorconfig')
lua require('rainbow')
lua require('tabularize')
lua require('ripgrep')
lua require('fugitive')
lua require('nvim-dap')
lua require('dadbod-commands')

color ayu
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " Filetypes
    " gradle syntax highlighting
    au BufNewFile,BufRead *.gradle set filetype=groovy
    " markdown  highlighting
    au BufNewFile,BufRead *.md set filetype=markdown

    " Remove trailing whitespace
    autocmd FileType c,cpp,javscript autocmd BufWritePre <buffer> :%s/\s\+$//e"
    nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" }}}
