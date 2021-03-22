lua require('plugins')
lua require('options')

" DBExt {{{{
    source $HOME/.psql.vim
" }}}}

lua require('backups')
lua require('config')
lua require('treesitter')
lua require('nvim-compe')
lua require('lsp-config')
lua require('telescope')
lua require('vim-test')
lua require('neoformat')
lua require('ale')
lua require('editorconfig')
lua require('rainbow')
lua require('tabularize')
lua require('ripgrep')
lua require('fugitive')

set background=dark
color ayu

" Git {{{
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
"}}}


    " Filetypes
    " gradle syntax highlighting
    au BufNewFile,BufRead *.gradle set filetype=groovy
    " hive ql highlighting
    au BufNewFile,BufRead *.hql set filetype=sql
    " markdown  highlighting
    au BufNewFile,BufRead *.md set filetype=markdown

    " Remove trailing whitespace
    autocmd FileType c,cpp,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e"
    nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

    "{{{{ JavaScript}}}}
    autocmd Filetype javascript setlocal tabstop=2          "Tab width = 2"
    autocmd Filetype javascript setlocal shiftwidth=2       "Auto indent = 2"
    autocmd Filetype javascript setlocal softtabstop=2      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype javascript setlocal expandtab          "Use spaces instead of tabs"

    "{{{{ xml}}}}
    autocmd Filetype xml setlocal foldmethod=syntax  "Makeit fold"
    autocmd Filetype xml setlocal tabstop=4          "Tab width = 2"
    autocmd Filetype xml setlocal shiftwidth=4       "Auto indent = 2"
    autocmd Filetype xml setlocal softtabstop=4      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype xml setlocal expandtab          "Use spaces instead of tabs"

    "{{{{ plantuml }}}}
    autocmd Filetype plantuml let s:makecommand='java -jar /usr/local/Cellar/plantuml/8031/plantuml.8031.jar %'
