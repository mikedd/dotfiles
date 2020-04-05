" vim:fdm=marker
" General configuration {{{
    set showmode                    " Display the current mode
    " set cursorline                  " Highlight current line
    " set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu				                  "show line numbers
    set clipboard=unnamedplus       "copy to the system clipboard
    set virtualedit=onemore         " Allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    set hidden                      " Allow buffer switching without saving
    set nowrap                      " do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every four columns
    set softtabstop=2               " Let backspace delete indent

    set smartcase                   " case sensitive search when search term has uppercase
    set pastetoggle=<F12>           " handles clipboard paste a little better

    set nofixendofline              "Do not add an end of line character
    set list

    let mapleader=","
" }}}
"
if has("termguicolors")
  set termguicolors
endif

" Vim Plug plugin list {{{
call plug#begin('~/.local/share/nvim/plugged')
" Tmux navigator {{{
    Plug 'git@github.com:christoomey/vim-tmux-navigator'
        " Helps with background color in tmux
        set t_Co=256
        set t_ut=
" }}}
" Fugitive {{{{
    Plug 'git@github.com:tpope/vim-fugitive'
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
    nnoremap <silent> <leader>gg :GitGutterToggle<CR>
" }}}}
" Surround {{{
    Plug 'git@github.com:tpope/vim-surround'
" }}}
" GitGutter {{{
    Plug 'git@github.com:airblade/vim-gitgutter'
" }}}
" NerdTree {{{
    Plug 'git@github.com:scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\.class', '\.swo$', '\.swp', '.git']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    map <silent> <F2> :NERDTreeToggle <CR>
" }}}
" Nerd Commenter {{{
    Plug 'scrooloose/nerdcommenter'
" }}}
" DBExt {{{
    Plug 'git@github.com:vim-scripts/dbext.vim'
    "source $HOME/.psql.vim
" }}}
" ripgrep {{{
    Plug 'git@github.com:jremmen/vim-ripgrep'
" }}}
" Tabularize {{{{
    Plug 'git@github.com:godlygeek/tabular'
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
"}}}}
" FZF {{{
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    "set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'
    let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden '
    nnoremap <silent> <leader>t :FZF<CR>
    nnoremap <silent> <c-p> :FZF<CR>
" }}}
" Airline {{{
    Plug 'git@github.com:bling/vim-airline'
" }}}
" json {{{
    Plug 'git@github.com:elzr/vim-json'
" }}}
" rainbow parens {{{
    Plug 'git@github.com:luochen1990/rainbow'
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" }}}
" EditorConfig {{{
    Plug 'git@github.com:editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns=[ 'fugitive://.*' ]
    let g:EditorConfig_exec_path='/usr/local/bin/editorconfig'
    let g:EditorConfig_code_mode='external_command'
" }}}
" Kotlin {{{
    Plug 'git@github.com:udalov/kotlin-vim'
" }}}
" ALE {{{
    Plug 'git@github.com:w0rp/ale'
    let g:ale_kotlin_languageserver_executable='/home/mikedd/work/KotlinLanguageServer/build/install/kotlin-language-server/bin/kotlin-language-server'
" }}}
" Rust {{{
    Plug 'git@github.com:rust-lang/rust.vim'
" }}}
" Tagbar {{{
    Plug 'majutsushi/tagbar'
" }}}
" Coc {{{
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}
" Syntasitc {{{
    Plug 'vim-syntastic/syntastic'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
" }}}
" Colors {{{
    Plug 'tomasiser/vim-code-dark'
    Plug 'rakr/vim-one'
    Plug 'jacoborus/tender.vim'
    Plug 'romainl/apprentice'
    Plug 'rakr/vim-two-firewatch'
    Plug 'tomasr/molokai'
    Plug 'fcevado/molokai_dark'
    Plug 'joshdick/onedark.vim'
    Plug 'Heorhiy/VisualStudioDark.vim'
" }}}
call plug#end()
" }}}

" General Configuration {{{
filetype plugin indent on
syntax on

set background=dark
color codedark
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
    set complete=.,w,b,u,t,i

" Markdown highlighting
au BufNewFile,BufRead *.md set filetype=markdown

" remove trailing whitespace
autocmd FileType c,cpp,javscript autocmd BufWritePre <buffer> :%s/\s\+$//e"
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Filetypes
" {{{{ Python }}}}
autocmd Filetype python setlocal tabstop=4
autocmd Filetype python setlocal shiftwidth=4
autocmd Filetype python setlocal softtabstop=4
autocmd Filetype python setlocal expandtab
" }}}
let g:python_host_prog = "~/.pyenv/versions/2.7.17/bin/python"  " Python 2
let g:python3_host_prog = "~/.pyenv/versions/3.8.2/bin/python"  " Python 3
