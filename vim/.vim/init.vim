" vim:fdm=marker
" General configuration {{{
"
    set clipboard=unnamedplus       "copy to the system clipboard
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          "show line numbers
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
    set hidden                      " Allow buffer switching without saving

    set nowrap                      " do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    set nofixendofline              "Do not add an end of line character


    let mapleader=","
" }}}

if has("termguicolors")
  set termguicolors
endif

" Vim Plug plugin list {{{
call plug#begin('~/.local/share/nvim/plugged')
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
" GitGutter {{{{
    Plug 'airblade/vim-gitgutter'
" }}}}
" Tmux navigator {{{{
    Plug 'christoomey/vim-tmux-navigator'
        " Helps with background color in tmux
        "set t_Co=256
        "set t_ut=
" }}}}
" NerdTree {{{{
    Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
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
" commenting {{{{
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-commentary'
" }}}}
" DBExt {{{{
    Plug 'vim-scripts/dbext.vim'
    source $HOME/.psql.vim
" }}}}
" dadbod {{{{
    Plug 'tpope/vim-dadbod'
" }}}}
" RipGrep {{{{
    Plug 'jremmen/vim-ripgrep'
    let g:rg_command = 'rg --hidden --vimgrep'
" }}}}
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
"}}}}
" SKIM {{{{
    Plug 'lotabout/skim'
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
    let $SK_DEFAULT_COMMAND = 'rg --hidden --files'
    "nnoremap <silent> <leader>t :SK<CR>
    nnoremap <silent> <c-p> :SK<CR>
" }}}}
" Airline {{{{
    Plug 'bling/vim-airline'
" }}}}
" json {{{{
    Plug 'elzr/vim-json'
" }}}}
" rainbow parens {{{{
    Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" }}}}
" EditorConfig {{{{
    Plug 'editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns=[ 'fugitive://.*' ]
    let g:EditorConfig_exec_path='/usr/local/bin/editorconfig'
    let g:EditorConfig_code_mode='external_command'
" }}}}
" Kotlin {{{{
    Plug 'udalov/kotlin-vim'
" }}}}
" ALE {{{{
    Plug 'dense-analysis/ale'
    let g:ale_kotlin_languageserver_executable='/home/mikedd/work/KotlinLanguageServer/build/install/kotlin-language-server/bin/kotlin-language-server'
    let g:ale_python_auto_pipenv=1
" }}}}
" Rust {{{{
    Plug 'rust-lang/rust.vim'
" }}}}
" Jedi {{{{
    Plug 'davidhalter/jedi-vim'
" }}}}
" postgres syntax {{{{
    Plug 'lifepillar/pgsql.vim'
" }}}}
" Re Structured text {{{{
    Plug 'gu-fan/InstantRst'
    Plug 'gu-fan/riv.vim'
" }}}}
" Conqueror Of Completion {{{{
    Plug 'neoclide/coc.nvim', {'tag': '*' , 'branch': 'release'}
" }}}}
" color schemes {{{{
    Plug 'joshdick/onedark.vim'
    Plug 'tomasiser/vim-code-dark'
    Plug 'rakr/vim-one'
    Plug 'danilo-augusto/vim-afterglow'
    Plug 'nightsense/carbonized'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'jacoborus/tender.vim'
    Plug 'romainl/apprentice'
    Plug 'rakr/vim-two-firewatch'
    Plug 'tomasr/molokai'
    Plug 'fcevado/molokai_dark'
    Plug 'Heorhiy/VisualStudioDark.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'ayu-theme/ayu-vim'

" }}}}

call plug#end()

set background=dark
color ayu
" }}}
" General Configuration {{{
filetype plugin indent on
syntax on

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

    " Filetypes
    " gradle syntax highlighting
    au BufNewFile,BufRead *.gradle set filetype=groovy
    " markdown  highlighting
    au BufNewFile,BufRead *.md set filetype=markdown

    " Remove trailing whitespace
    autocmd FileType c,cpp,javscript autocmd BufWritePre <buffer> :%s/\s\+$//e"
    nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
  
    "Tidy your XML
      let s:has_tidy = executable('tidy')
      if s:has_tidy
          if !exists(':Thtml')
              command Thtml :%!tidy -q -i --show-errors 0
          endif
          if !exists(':Txml')
              command Txml  :%!tidy -q -i --show-errors 0 -xml
          endif
      endif
" }}}

let g:python_host_prog = "~/.pyenv/versions/2.7.17/bin/python"  " Python 2
let g:python3_host_prog = "~/.pyenv/versions/3.8.2/bin/python"  " Python 3

