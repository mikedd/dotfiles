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
" Vim Plug plugin list {{{
    call plug#begin('~/.vim/plugged')

" Fugitive {{{{
    Plug 'tpope/vim-fugitive'
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
        nnoremap <silent> <leader>gg :GitGutterToggle<CR>
" }}}}
" Surround {{{{
    Plug 'tpope/vim-surround'
" }}}}
"GitGutter {{{{
    Plug 'airblade/vim-gitgutter'
" }}}}
" Molokai {{{{
    Plug 'git@github.com:tomasr/molokai'
" }}}}
" Vim Colorschemes {{{{
    Plug 'git@github.com:flazz/vim-colorschemes'
" }}}}
" Tmux navigator {{{{
    Plug 'christoomey/vim-tmux-navigator'
        " Helps with background color in tmux
        set t_ut=
" }}}}
" NerdTree {{{{
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
" }}}}
" NerdCommenter {{{{
    Plug 'scrooloose/nerdcommenter'
" }}}}
" Syntastic {{{{
    Plug 'scrooloose/syntastic'
" }}}}
" Delimitmate {{{{
    Plug 'vim-scripts/delimitMate.vim'
        let delimitMate_expand_cr = 1
        let delimitMate_smart_matchpairs=1
" }}}}
" JavaComplete {{{{
    Plug 'vim-scripts/javacomplete', { 'for' : 'java' }
" }}}}
" OrgMode {{{{
    Plug 'jceb/vim-orgmode', { 'for' : 'org' }
" }}}}
" DBExt {{{{
    Plug 'vim-scripts/dbext.vim'
" }}}}
" Ag - quick grep {{{{
    "Plug 'git@github.com:rking/ag.vim'
" }}}
" Ack - actually Ag in disguise{{{{
    Plug 'git@github.com:mileszs/ack.vim'
    if executable('ag')
        let g:ackprg = 'ag --vimgrep'
    endif
    cnoreabbrev Ack Ack!
    cnoreabbrev Ag Ack!
    "nnoremap <Leader>a :Ack!<Space>
" }}}
" Tabularize {{{{
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
" }}}}
" Json syntax   {{{{
    Plug 'elzr/vim-json'
" }}}}
" Rainbow parens {{{{
    Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1
" }}}}
" fuzzy search {{{{
    Plug 'junegunn/fzf'
" }}}}


call plug#end()
" }}}
" General Configuration {{{
filetype plugin indent on
syntax on

    " Copy Pasta {{{{
        set clipboard=unnamedplus
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
    if filereadable(expand("~/.vim/plugged/molokai/colors/molokai.vim"))
        color molokai
    endif
" }}}
" Git {{{
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
"}}}
" Status line {{{
    "if has('statusline')
        ""statusline setup
        "set statusline =%#identifier#
        "set statusline+=[%t] "tail of the filename
        "set statusline+=%*
        ""display a warning if fileformat isnt unix
        "set statusline+=%#warningmsg#
        "set statusline+=%{&ff!='unix'?'['.&ff.']':''}
        "set statusline+=%*
        ""display a warning if file encoding isnt utf-8
        "set statusline+=%#warningmsg#
        "set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
        "set statusline+=%*
        "set statusline+=%h "help file flag
        "set statusline+=%y "filetype
        ""read only flag
        "set statusline+=%#identifier#
        "set statusline+=%r
        "set statusline+=%*
        ""modified flag
        "set statusline+=%#identifier#
        "set statusline+=%m
        "set statusline+=%*
        "set statusline+=%{fugitive#statusline()}
        ""display a warning if &et is wrong, or we have mixed-indenting
        "set statusline+=%#error#
        "set statusline+=%{StatuslineTabWarning()}
        "set statusline+=%*
        "set statusline+=%{StatuslineTrailingSpaceWarning()}
        ""set statusline+=%{StatuslineLongLineWarning()}
        "set statusline+=%#warningmsg#
        "set statusline+=%{SyntasticStatuslineFlag()}
        ""set statusline+=%*
        ""display a warning if &paste is set
        "set statusline+=%#error#
        "set statusline+=%{&paste?'[paste]':''}
        "set statusline+=%*
        "set statusline+=%= "left/right separator
        ""set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
        "set statusline+=%c, "cursor column
        "set statusline+=%l/%L "cursor line/total lines
        "set statusline+=\ %P "percent through file
        "set laststatus=2        "Show statusline even if there is no split

        ""recalculate the trailing whitespace warning when idle, and after saving
        "autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

        ""return '[\s]' if trailing white space is detected
        ""return '' otherwise
        "function! StatuslineTrailingSpaceWarning()
            "if !exists("b:statusline_trailing_space_warning")
                "if !&modifiable
                    "let b:statusline_trailing_space_warning = ''
                    "return b:statusline_trailing_space_warning
                "endif
                "if search('\s\+$', 'nw') != 0
                    "let b:statusline_trailing_space_warning = '[\s]'
                "else
                    "let b:statusline_trailing_space_warning = ''
                "endif
            "endif
            "return b:statusline_trailing_space_warning
        "endfunction

        ""return the syntax highlight group under the cursor ''
        "function! StatuslineCurrentHighlight()
            "let name = synIDattr(synID(line('.'),col('.'),1),'name')
            "if name == ''
                "return ''
            "else
                "return '[' . name . ']'
            "endif
        "endfunction

        ""recalculate the tab warning flag when idle and after writing
        "autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

        ""return '[&et]' if &et is set wrong
        ""return '[mixed-indenting]' if spaces and tabs are used to indent
        ""return an empty string if everything is fine
        "function! StatuslineTabWarning()
            "if !exists("b:statusline_tab_warning")
                "let b:statusline_tab_warning = ''
                "if !&modifiable
                    "return b:statusline_tab_warning
                "endif
                "let tabs = search('^\t', 'nw') != 0
                ""find spaces that arent used as alignment in the first indent column
                "let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
                "if tabs && spaces
                    "let b:statusline_tab_warning = '[mixed-indenting]'
                "elseif (spaces && !&et) || (tabs && &et)
                    "let b:statusline_tab_warning = '[&et]'
                "endif
            "endif
            "return b:statusline_tab_warning
        "endfunction
    "endif
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

    " Remove trailing whitespace
    autocmd FileType c,cpp,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e"
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

    "{{{{ JavaScript}}}}
    autocmd Filetype javascript setlocal tabstop=2          "Tab width = 2"
    autocmd Filetype javascript setlocal shiftwidth=2       "Auto indent = 2"
    autocmd Filetype javascript setlocal softtabstop=2      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype javascript setlocal expandtab          "Use spaces instead of tabs"

    "{{{{ Java}}}}
    autocmd Filetype java setlocal tabstop=2          "Tab width = 2"
    autocmd Filetype java setlocal shiftwidth=2       "Auto indent = 2"
    autocmd Filetype java setlocal softtabstop=2      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype java setlocal expandtab          "Use spaces instead of tabs"

    "{{{{ Yaml}}}}
    autocmd Filetype yaml setlocal tabstop=2          "Tab width = 2"
    autocmd Filetype yaml setlocal shiftwidth=2       "Auto indent = 2"
    autocmd Filetype yaml setlocal softtabstop=2      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype yaml setlocal expandtab          "Use spaces instead of tabs"


"}}}

