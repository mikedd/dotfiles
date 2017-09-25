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

    " Get out of insert mode
    :imap  jj <Esc>

" Search {{{{
    let s:has_ag = executable('ag')
    let s:has_ack = executable('ack')
" }}}}

" }}}
" Vim Plug plugin list {{{
    call plug#begin('~/.vim/plugged')
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
" Surround {{{{
    Plug 'git@github.com:tpope/vim-surround'
" }}}}
" GitGutter {{{{
    Plug 'git@github.com:airblade/vim-gitgutter'
" }}}}
" Molokai {{{{
    Plug 'git@github.com:tomasr/molokai'
" }}}}
" Vim Colorschemes {{{{
    Plug 'git@github.com:flazz/vim-colorschemes'
" }}}}
" Tmux navigator {{{{
    Plug 'git@github.com:christoomey/vim-tmux-navigator'
        " Helps with background color in tmux
        set t_ut=
" }}}}
" NerdTree {{{{
    Plug 'git@github.com:scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
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
    Plug 'git@github.com:scrooloose/nerdcommenter'
" }}}}
" Syntastic {{{{
    Plug 'git@github.com:scrooloose/syntastic'
    " Can't trust fsc to work properly
    let g:syntastic_mode_map = { 'passive_filetypes': ['scala'] }
    " Eslint autodetection on OSX is muddy.. Try eslint_d.
    let g:syntastic_javascript_checkers = [ 'eslint_d', 'eslint' ]
    let g:syntastic_javascript_eslint_exec = '/Users/z001rw6/.nvm/versions/node/v6.9.4/bin/eslint_d'
" }}}}
" Tagbar {{{{
    "Plug 'git@github.com:majutsushi/tagbar'
" }}}}
" Delimitmate {{{{
    Plug 'git@github.com:vim-scripts/delimitMate.vim'
        let delimitMate_expand_cr = 1
        let delimitMate_smart_matchpairs=1
" }}}}
" YouCompleteMe {{{{
    Plug 'git@github.com:Valloric/YouCompleteMe', { 'do': './install.sh' }
" }}}}
" Autotags {{{{
    Plug 'git@github.com:basilgor/vim-autotags'
" }}}}
" OrgMode {{{{
    Plug 'git@github.com:jceb/vim-orgmode', { 'for' : 'org' }
" }}}}
" DBExt {{{{
    Plug 'git@github.com:vim-scripts/dbext.vim'
    "let g:dbext_default_profile_ASA_ODBC = 'type=ODBC:user=dba:passwd=sql:dsnname=SQL Anywhere 10 Demo'
    " Does not work, not a valid database type
    source $HOME/.psql.vim 
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
" CtrlP {{{{"
    "Plug 'git@github.com:kien/ctrlp.vim'
        "let g:ctrlp_map = '<c-t>'
" }}}}
" FZF {{{{"
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        "let g:ctrlp_map = '<c-t>'
        let $FZF_DEFAULT_COMMAND = 'ag -l '
        nnoremap <silent> <leader>t :FZF<CR>
        nnoremap <silent> <c-p> :FZF<CR>
" }}}}
" ZenCoding for fast HTML completions {{{{
    Plug 'git@github.com:mattn/emmet-vim'
" }}}}
" {{{{ airline and bufferline
    Plug 'git@github.com:bling/vim-airline'
    "Plug 'git@github.com:bling/vim-bufferline'
" }}}}
" SpeedDating  - needed by some other plugin? {{{{
    Plug 'git@github.com:tpope/vim-speeddating'
" }}}}
" Chef syntax {{{{
    Plug 'git@github.com:vadv/vim-chef'
" }}}}
" Cassandra CQL syntax {{{{
    Plug 'git@github.com:elubow/cql-vim'
" }}}}
" Scala syntax {{{{
    Plug 'git@github.com:derekwyatt/vim-scala'
" }}}}
" MediaWiki syntax {{{{
    Plug 'git@github.com:chikamichi/mediawiki.vim'
" }}}}
" Hive syntax {{{{
    Plug 'git@github.com:autowitch/hive.vim'
" }}}}
" Docker syntax {{{{
    Plug 'git@github.com:docker/docker',  {'rtp' : '/contrib/syntax/vim'}
" }}}}
" Json syntax {{{{
    Plug 'git@github.com:elzr/vim-json'
" }}}}
" PlantUml syntax {{{{
    Plug 'git@github.com:aklt/plantuml-syntax'
    let g:plantuml_executable_script='java -jar /usr/local/Cellar/plantuml/8041/plantuml.8041.jar'
" }}}}
" Rainbow parens syntax {{{{
    Plug 'git@github.com:luochen1990/rainbow'
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" }}}}
" EditorConfig {{{{
    Plug 'git@github.com:editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']
    let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
    let g:EditorConfig_code_mode = 'external_command'
"}}}}}
" Markdown preview {{{{
    Plug 'git@github.com:JamshedVesuna/vim-markdown-preview'
    let vim_markdown_preview_github=1
    let vim_markdown_preview_hotkey='<C-m>'
"}}}}}
" Java complete 2 {{{{
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
"}}}}}

call plug#end()
" }}}
" General Configuration {{{
filetype plugin indent on
syntax on

    " Copy Pasta {{{{
        set clipboard=unnamed       "Share clipboard with OSX
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
    " hive ql highlighting
    au BufNewFile,BufRead *.hql set filetype=sql
    " markdown  highlighting
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
    autocmd Filetype java setlocal tabstop=4          "Tab width = 2"
    autocmd Filetype java setlocal shiftwidth=4       "Auto indent = 2"
    autocmd Filetype java setlocal softtabstop=4      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype java setlocal expandtab          "Use spaces instead of tabs"

    "{{{{ Ruby}}}}
    autocmd Filetype ruby  setlocal tabstop=2          "Tab width = 2"
    autocmd Filetype ruby  setlocal shiftwidth=2       "Auto indent = 2"
    autocmd Filetype ruby  setlocal softtabstop=2      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype ruby  setlocal expandtab          "Use spaces instead of tabs"

    "{{{{ Yaml}}}}
    autocmd Filetype yaml  setlocal tabstop=2          "Tab width = 2"
    autocmd Filetype yaml  setlocal shiftwidth=2       "Auto indent = 2"
    autocmd Filetype yaml  setlocal softtabstop=2      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype yaml  setlocal expandtab          "Use spaces instead of tabs"

    "{{{{ Chef & Other devops cruft}}}}
    autocmd BufNewFile,BufRead Gemfile set filetype=ruby
    autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
    autocmd BufNewFile,BufRead Berksfile set filetype=ruby

    "{{{{ plantuml }}}}
    autocmd Filetype plantuml let s:makecommand='java -jar /usr/local/Cellar/plantuml/8031/plantuml.8031.jar %'
"}}}

