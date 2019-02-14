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

" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Vim Plug plugin list {{{
call plug#begin('~/.local/share/nvim/plugged')
" Tmux navigator {{{
    Plug 'christoomey/vim-tmux-navigator'
        " Helps with background color in tmux
        set t_ut=
" }}}
" vim Surround {{{
    Plug 'tpope/vim-surround'
" }}}
" Git gutter {{{
    Plug 'airblade/vim-gitgutter'
" }}}
" molokai {{{
    Plug 'tomasr/molokai'
    Plug 'fcevado/molokai_dark'
" }}}
" One dark {{{
    Plug 'joshdick/onedark.vim'
" }}}
" One dark really dark {{{
    Plug 'rakr/vim-one'
" }}}
" VS Code Colors {{{
    Plug 'tomasiser/vim-code-dark'
" }}}
" VS Code Colors again {{{
    Plug 'Heorhiy/VisualStudioDark.vim'
" }}}
" NerdTree {{{
    Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
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
    Plug 'vim-scripts/dbext.vim'
" }}}
" FZF {{{
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    "let FZF_DEFAULT_COMMAND='rg --files --hidden --follow --ignore'
    "nnoremap <silent> <leader>t :FZF<CR>
    " :FZF == :Files which doesn't seem to respect .gitignore
    " :GFiles considers version control
    nnoremap <silent> <c-p> :GFiles <CR>
" }}}
" ripgrep {{{
    Plug 'jremmen/vim-ripgrep'
" }}}
" Airline {{{
    Plug 'bling/vim-airline'
" }}}
" json {{{
    Plug 'elzr/vim-json'
" }}}
" rainbow parens {{{
    Plug 'luochen1990/rainbow'
" }}}
" EditorConfig {{{
    Plug 'editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns=[ 'fugitive://.*' ]
    let g:EditorConfig_exec_path='/usr/local/bin/editorconfig'
    let g:EditorConfig_code_mode='external_command'
" }}}
" Kotlin {{{
    Plug 'udalov/kotlin-vim'
" }}}
" ALE {{{
    Plug 'w0rp/ale'
    let g:ale_kotlin_languageserver_executable='/home/mikedd/work/KotlinLanguageServer/build/install/kotlin-language-server/bin/kotlin-language-server'
" }}}
" Http Client {{{
    Plug 'aquach/vim-http-client'
    let g:http_client_verify_ssl=0
    let g:http_clien_focus_output_window=0
" }}}
" Tagbar {{{
    Plug 'majutsushi/tagbar'
" }}}
call plug#end()
" }}}

" General Configuration {{{
filetype plugin indent on
syntax on

set background=dark
color codedark
" }}}

" Backups {{{
set backup
if has ('persistent_undo')
  set undofile            " persistent undo
  set undolevels=1000     " number of changes that undo / redo remember
  set undoreload=10000    " max lines to save for undo on a buffer reload
endif


" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  call mkdir($HOME.'/.vim/backup', 'p')
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  call mkdir($HOME.'/.vim/swap', 'p')
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
if exists('+shada')
  set shada+=n~/.nvim/shada
else
  set viminfo+=n~/.vim/viminfo
endif

" This is only present in 7.3+ {{{3
if exists('+undofile')
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  if isdirectory($HOME . '/.vim/undo') == 0
    call mkdir($HOME.'/.vim/undo', 'p')
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Development settings {{{
"
" I'm not sure what this does or whether I ever used it properlyy
" set complete = .,w,b,u,t,i

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
