" vim:fdm=marker

" Initialization {{{
    set nocompatible    " Be iMproved

    set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    let g:rehash256 = 1

    " Windows compatibility {{{{
    if !(has('win16') || has('win32') || has('win64'))
        set shell=/bin/sh
    endif

    if has('win32') || has('win64')
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
    " backspace doesn't work on windows without doing this
    set bs=2
    " }}}}

    " disable the bells
    set noeb vb t_vb=

    "  Key (re)Mappings 
    let mapleader = ','
    " Search {{{{
        let s:has_ag = executable('ag')
        let s:has_ack = executable('ack')
    " }}}}

" }}}
" NeoBundle setup {{{ 
    if has('vim_starting') 
        set runtimepath+=~/.vim/bundle/neobundle.vim
    end

    call neobundle#rc(expand('~/.vim/bundle'))

    " Let Neobundle manage neoBundle
    NeoBundleFetch 'Shougo/neobundle.vim'
" }}}
" Plugin list {{{
    "
    " Recommended by Shougo / neobundle readme
    " After install, turn shell ~/.vim/bundle/vimproc, (n,g)mage -f
    " your_machines_makefile
    "
    NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \   'windows' : 'make -f make_mingw32.mak',
        \   'cygwin' : 'make -f make_cygwin.mak',
        \   'mac' : 'make -f make_mac.mak',
        \   'unix' : 'make -f make_unix.mak',
        \   },
        \ }
    NeoBundle 'Shougo/unite.vim'

    " Git
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'airblade/gitgutter'

    " Colors
    NeoBundle 'tomasr/molokai'

    " Tmux
    NeoBundle 'christoomey/vim-tmux-navigator'

    " Files 
    NeoBundle 'scrooloose/nerdtree'

    " Coding
    NeoBundle 'scrooloose/nerdcommenter'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'vim-scripts/delimitMate.vim'
    NeoBundle 'Valloric/YouCompleteMe'
    NeoBundle 'vim-scripts/javacomplete'
    NeoBundle 'bpowell/vim-android'

    " Org
    NeoBundle 'jceb/vim-orgmode'
"}}}
" Plugin Config {{{
    " Delimitmate {{{
        " Delimitmate cr
        let delimitMate_expand_cr = 1
        let delimitMate_smart_matchpairs=1
    "}}}
    " Tmux {{{ 
        " Helps with background color in tmux 
        set t_ut=
    " }}}
    " Unite {{{{ 
        " Makes Unite faster.
        if s:has_ag
            let g:unite_source_rec_async_command = 'ag -l . '
        elseif s:has_ack
            let g:unite_source_rec_async_command = 'ack -f --nofilter'
        end

        " Make unite match fuzzy? 
        "call unite#custom_source('file_rec', 'matchers', ['matcher_fuzzy'])
        call unite#custom_source('file_rec', 'ignore_pattern', '[A-Z|a-z]*\.class|target|.*\.iml')

        "Does not appear to work :(
        let g:unite_source_history_yank_enable = 1 
        "" Does not sort but does do fairly good fuzzy matching. 
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        "call unite#filters#matcher_default#use(['unite-filter-sorter_rank'])
        nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async<cr>
        nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
        nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
        nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
        nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
        nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
    " }}}}
    " NerdTree {{{{
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\.class', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0

        "NerdTree toggle
        map <silent> <F2> :NERDTreeToggle <CR>
    " }}}}
    " Tabularize {{{{
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
    " }}}}
    " Fugitive {{{{
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
        nnoremap <silent> <leader>gg :GitGutterToggle<CR>
    "}}}}
" }}}
" General Configuration {{{
filetype plugin indent on
syntax on 

    " Copy Pasta {{{{
        if has('x') && has ('gui') " on linux use + register for copy/paste
            set clipboard=unnamedplus
        elseif has('gui') " Windows and Mac use *
            set clipboard=unnamed
        endif 
    "}}}}

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
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
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
    if filereadable(expand("~/.vim/bundle/molokai/colors/molokai.vim"))
        color molokai
    endif
" }}}
" Git {{{
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
"}}}
" Status line {{{
    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif
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
    " set ctags 
    set tags=$HOME/.tags,$HOME/athena.tags

    " set completion
    set complete=.,w,b,u,t,i

    " Filetypes 
    au BufRead,BufNewFile,BufFilePost *.gradle set filetype=gradle
"}}}
" GVIM {{{
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set guioptions-=L           " Remove the leftbar
        set guioptions-=l           " Remove the ?
        set guioptions-=r           " Remove the ?
        set guioptions-=R           " Remove the ?
        set lines=40                " 40 lines of text instead of 24
        if has("gui_gtk2")
            set guifont=Inconsolata\ Regular\ 11,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif has("gui_mac")
            set guifont=Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif has("gui_win32")
            set guifont=Consolas:h10,Courier_New:h10
        else 
            set guifont=Inconsolata\ Regular\ 11,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        endif
    else 
        set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
" }}}
