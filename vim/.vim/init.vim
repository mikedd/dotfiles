" vim:fdm=marker
" Initialization {{{
    set nocompatible    " Be iMproved

    set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    let g:rehash256 = 1

    " Windows compatibility {{{
    if !(has('win16') || has('win32') || has('win64'))
        set shell=/bin/sh
    endif

    if has('win32') || has('win64')
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
    " backspace doesn't work on windows without doing this
    set bs=2
    " }}}

    " disable the bells
    set noeb vb t_vb=

    "  Key (re)Mappings
    let mapleader = ','
    " Search {{{
        let s:has_ag = executable('ag')
        let s:has_ack = executable('ack')
    " }}}

" }}}
" Vim Plug plugin list {{{
    call plug#begin('~/.vim/plugged')
" Fugitive {{{
    Plug 'tpope/vim-fugitive'
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
        nnoremap <silent> <leader>gg :GitGutterToggle<CR>
" }}}
" Surround {{{
    Plug 'tpope/vim-surround'
" }}}
"GitGutter {{{
    Plug 'airblade/vim-gitgutter'
" }}}
" Molokai {{{
    Plug 'git@github.com:tomasr/molokai'
    let g:molokai_original=1
" }}}
" Molokai-dark {{{
    Plug 'git@github.com:pR0Ps/molokai-dark'
" }}}
" Dracula {{{
    Plug 'git@github.com:dracula/vim'
" }}}
" Tmux navigator {{{
    Plug 'christoomey/vim-tmux-navigator'
        " Helps with background color in tmux
        set t_ut=
" }}}
" NerdTree {{{
    Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
        "map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\.class', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
        map <silent> <F2> :NERDTreeToggle <CR>
" }}}
" NerdCommenter {{{
    Plug 'scrooloose/nerdcommenter'
" }}}
" Syntastic {{{
    Plug 'scrooloose/syntastic'
" }}}
" Delimitmate {{{
    Plug 'vim-scripts/delimitMate.vim'
        let delimitMate_expand_cr = 1
        let delimitMate_smart_matchpairs=1
" }}}
" JavaComplete {{{
    Plug 'vim-scripts/javacomplete', { 'for' : 'java' }
" }}}
" OrgMode {{{
    Plug 'jceb/vim-orgmode', { 'for' : 'org' }
" }}}
" DBExt {{{
    Plug 'vim-scripts/dbext.vim'
" }}}
" Ack - actually Ag in disguise{{{
    Plug 'git@github.com:mileszs/ack.vim'
    if executable('ag')
        let g:ackprg = 'ag --vimgrep'
    endif
    cnoreabbrev Ack Ack!
    cnoreabbrev Ag Ack!
    "nnoremap <Leader>a :Ack!<Space>
" }}}
" Tabularize {{{
    Plug 'godlygeek/tabular'
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
"}}}
" CtrlP {{{"
    "Plug 'git@github.com:kien/ctrlp.vim'
        "let g:ctrlp_map = '<c-t>'
" }}}
" FZF {{{"
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        "let g:ctrlp_map = '<c-t>'
        let $FZF_DEFAULT_COMMAND = 'ag -l '
        nnoremap <silent> <leader>t :FZF<CR>
        nnoremap <silent> <c-p> :FZF<CR>
" }}}
" Json syntax {{{
    Plug 'git@github.com:elzr/vim-json'
" }}}
" EditorConfig {{{
    Plug 'git@github.com:editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']
    let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
    let g:EditorConfig_code_mode = 'external_command'
"}}}}
" Rainbow parens {{{
    Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1
" }}}
" airline and bufferline {{{
    Plug 'git@github.com:bling/vim-airline'
    "Plug 'git@github.com:bling/vim-bufferline'
" }}}
" Java complete 2 {{{
    Plug 'git@github.com:artur-shaik/vim-javacomplete2'
    let g:JavaComplete_ImportSortType='packageName'
    " Google Style import order
    let g:JavaComplete_ImportOrder = ['com.google.', '*', 'java.', 'javax.']
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    nmap <F5> <Plug>(JavaComplete-Imports-Add)
    imap <F5> <Plug>(JavaComplete-Imports-Add)
    nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
    imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"}}}}
" Http client {{{
    Plug 'git@github.com:aquach/vim-http-client'
" }}}
call plug#end()
" }}}
" General Configuration {{{
filetype plugin indent on
syntax on

    " Copy Pasta {{{
        set clipboard=unnamedplus
    "}}}

    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    "set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set hidden                          " Allow buffer switching without saving

    set nowrap                      " Wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every four columns
    set softtabstop=2               " Let backspace delete indent
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
    endif
" }}}
" Backup and Swap {{{
    set backup                      " Backups are nice ...
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif
"}}}
" Colors {{{
    set background=dark
    if filereadable(expand("~/.vim/plugged/molokai/colors/molokai.vim"))
        color molokai
    endif
" }}}
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
" Development {{{
    " set completion
    set complete=.,w,b,u,t,i

    " Filetypes
    " gradle syntax highlighting
    au BufNewFile,BufRead *.gradle set filetype=groovy

    "No Modula for me - just markdown please
    au BufNewFile,BufRead *.md set filetype=markdown

    " Oh my zsh themes
    au BufNewFile,BufRead *.zsh-theme set filetype=zsh

    " Remove trailing whitespace
    autocmd FileType c,cpp,javascript,json,css autocmd BufWritePre <buffer> :%s/\s\+$//e"
    nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

    "Tidy yo XML
    let s:has_tidy = executable('tidy')
    if s:has_tidy
        if !exists(':Thtml')
            command Thtml :%!tidy -q -i --show-errors 0
        endif
        if !exists(':Txml')
            command Txml  :%!tidy -q -i --show-errors 0 -xml
        endif
    endif

    "{{{ JavaScript}}}
    autocmd Filetype javascript setlocal tabstop=2          "Tab width = 2"
    autocmd Filetype javascript setlocal shiftwidth=2       "Auto indent = 2"
    autocmd Filetype javascript setlocal softtabstop=2      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype javascript setlocal expandtab          "Use spaces instead of tabs"

    "{{{ Java}}}
    autocmd Filetype java setlocal tabstop=4          "Tab width = 2"
    autocmd Filetype java setlocal shiftwidth=4       "Auto indent = 2"
    autocmd Filetype java setlocal softtabstop=4      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype java setlocal expandtab          "Use spaces instead of tabs"

    "{{{ Yaml}}}
    autocmd Filetype yaml  setlocal tabstop=2          "Tab width = 2"
    autocmd Filetype yaml  setlocal shiftwidth=2       "Auto indent = 2"
    autocmd Filetype yaml  setlocal softtabstop=2      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype yaml  setlocal expandtab          "Use spaces instead of tabs"


    "{{{ plantuml }}}
    autocmd Filetype plantuml let s:makecommand='java -jar /usr/local/Cellar/plantuml/8031/plantuml.8031.jar %'
"}}}
||||||| merged common ancestors
=======
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
