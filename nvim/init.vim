lua require("plugins")

" vim:fdm=marker
" General configuration {{{
"
syntax on
lua require('options')
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set number                          "show line numbers
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
highlight clear SignColumn      " SignColumn should match background for things like vim-gitgutter

set nofixendofline              "Do not add an end of line character

let mapleader=","
" }}}

" Misc from dev on duty{{{
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] " syntax highlighting in markdown
" }}}

" if has("termguicolors")
set termguicolors
" endif
" Plugin config {{{
" }}}}
" DBExt {{{{
    source $HOME/.psql.vim
" }}}}
" SKIM {{{{
    " let $SKIM_DEFAULT_COMMAND = 'git ls-tree -r --name-only HEAD || rg --files'
    "nnoremap <silent> <leader>t :SK<CR>
    " nnoremap <silent> <c-p> :SK<CR>
" }}}}
" rainbow parens {{{{
    " let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" }}}}

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
" }}}
" Backup and Swap {{{
    set backup                      " Backups are nice ...
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif
"}}}
" Git {{{
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
"}}}

" Initialize directories {{{
" =========================================================================================
" Functions (from SPF13)
" =========================================================================================
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    " Finish local init (SPF13)
    call InitializeDirectories()
" }}}

" Development settings {{{

    " Filetypes
    " gradle syntax highlighting
    au BufNewFile,BufRead *.gradle set filetype=groovy
    " markdown  highlighting
    au BufNewFile,BufRead *.md set filetype=markdown

    " Remove trailing whitespace
    autocmd FileType c,cpp,javscript autocmd BufWritePre <buffer> :%s/\s\+$//e"
    nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" }}}

let g:python_host_prog = "~/.pyenv/versions/2.7.18/bin/python"  " Python 2
let g:python3_host_prog = "~/.pyenv/versions/3.8.5/bin/python"  " Python 3

