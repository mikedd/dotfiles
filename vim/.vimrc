" vim:fdm=marker
" Initialization {{{
let mapleader=","
" }}}
" Vim Plug plugin list {{{
    call plug#begin('~/.local/share/nvim/plugged~/.vim/plugged')
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
" DBExt {{{{
    Plug 'git@github.com:vim-scripts/dbext.vim'
    source $HOME/.psql.vim
" }}}}
" RipGrep {{{{
    Plug 'git@github.com:jremmen/vim-ripgrep'

" }}}}
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
" FZF {{{{"
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        "let g:ctrlp_map = '<c-t>'
        let $FZF_DEFAULT_COMMAND = 'ag -l '
        nnoremap <silent> <leader>t :FZF<CR>
        nnoremap <silent> <c-p> :FZF<CR>
" }}}}
" airline and bufferline {{{{
    Plug 'git@github.com:bling/vim-airline'
" }}}}
" Json syntax {{{{
    Plug 'git@github.com:elzr/vim-json'
" }}}}
" PlantUml syntax {{{{
    "Plug 'git@github.com:aklt/plantuml-syntax'
    "let g:plantuml_executable_script='java -jar /usr/local/Cellar/plantuml/8041/plantuml.8041.jar'
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
" Colors"? {{{{
   Plug 'git@github.com:joshdick/onedark.vim'
" }}}}
" Vim Kotlin {{{{
    Plug 'git@github.com:udalov/kotlin-vim'
"}}}}
" VS Code colorscheme {{{{
    Plug 'git@github.com:tomasiser/vim-code-dark'
"}}}}
" ALE {{{{
    Plug 'git@github.com:w0rp/ale'
    "let g:ale_kotlin_ktlint_executable='/usr/local/bin/ktlint'
    let g:ale_kotlin_languageserver_executable='/Users/z001rw6/work/KotlinLanguageServer/build/install/kotlin-language-server/bin/kotlin-language-server'
    let g:ale_python_auto_pipenv=1
" }}}}
" NCM2 {{{{
    Plug 'git@github.com:ncm2/ncm2'
    Plug 'git@github.com:ncm2/ncm2-jedi'
" }}}}
" Vim http client (REST) {{{{
    let g:http_client_verify_ssl=0
    Plug 'git@github.com:aquach/vim-http-client'
    let g:http_client_focus_output_window=0
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

    set nofixendofline              " Do not add a new line character

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
        color codedark
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

    "{{{{ xml}}}}
    autocmd Filetype xml setlocal foldmethod=syntax  "Makeit fold"
    autocmd Filetype xml setlocal tabstop=4          "Tab width = 2"
    autocmd Filetype xml setlocal shiftwidth=4       "Auto indent = 2"
    autocmd Filetype xml setlocal softtabstop=4      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype xml setlocal expandtab          "Use spaces instead of tabs"

    "{{{{ plantuml }}}}
    autocmd Filetype plantuml let s:makecommand='java -jar /usr/local/Cellar/plantuml/8031/plantuml.8031.jar %'
"}}}

    let g:python_host_prog = '/Users/z001rw6/.pyenv/versions/2.7.15/bin/python2.7'  " Python 2
    let g:python3_host_prog = '/Users/z001rw6/.pyenv/versions/3.7.2/bin/python3.7'  " Python 3
