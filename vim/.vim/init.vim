" vim:fdm=marker
" General configuration {{{
"

filetype plugin indent on
syntax on
"set incsearch                   " Find as you type search
set autoindent                  " Indent at the same level of the previous line
set backspace=indent,eol,start  " Backspace for dummies
set clipboard=unnamedplus       "copy to the system clipboard
set complete=.,w,b,u,t,i
set completeopt=menuone,noinsert,noselect  " From devOnDuty and nvim-lua/completion-nvim
set cmdheight=1                 " From devOnDuty
set cursorline                  " Highlight current line
set expandtab                   " Tabs are spaces, not tabs
" set foldenable                  " Auto fold code
set hidden                      " Allow buffer switching without saving
set history=1000                    " Store a ton of history (default is 20)
" set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
" set linespace=0                 " No extra spaces between rows
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" set nowrap                      " do not wrap long lines
set number                          "show line numbers
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
" set scrolljump=5                " Lines to scroll when cursor leaves screen
" set scrolloff=3                 " Minimum lines to keep above and below cursor
set shiftwidth=4                " Use indents of 4 spaces
" set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set shortmess+=c                " From devOnDuty
set showmatch                   " Show matching brackets/parenthesis
" set showmode                    " Display the current mode
set smartcase                   " Case sensitive when uc present
set softtabstop=4               " Let backspace delete indent
set tabstop=4                   " An indentation every four columns
" set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
"set virtualedit=onemore             " Allow for cursor beyond last character
"set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
"set wildmenu                    " Show list instead of just completing
"set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
"set winminheight=0              " Windows can be 0 line high
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
" }}}}
" NerdTree {{{{
    " Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
    " let NERDTreeShowBookmarks=1
    " let NERDTreeIgnore=['\.pyc', '\.class', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    " let NERDTreeChDirMode=0
    " let NERDTreeQuitOnOpen=1
    " let NERDTreeMouseMode=2
    " let NERDTreeShowHidden=1
    " let NERDTreeKeepTreeInNewTab=1
    " let g:nerdtree_tabs_open_on_gui_startup=0
    " map <silent> <F2> :NERDTreeToggle <CR>
" }}}}
" commenting {{{{
    " Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-commentary'
" }}}}
" DBExt {{{{
    Plug 'vim-scripts/dbext.vim'
    source $HOME/.psql.vim
" }}}}
" dadbod {{{{
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui'
    Plug 'tpope/vim-dotenv'
    " if filereadable("$HOME/.dadbod-ui.vim")
        source $HOME/.dadbod-ui.vim
    " endif
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
    " This does not work if you have an existing .skim directory (might be a
    " problem if you install from cargo). Wipe the old dir out and re-run
    " plug-install
    Plug 'lotabout/skim' , { 'dir': '~/.skim', 'do': './install' }
    Plug 'lotabout/skim.vim'
    let $SKIM_DEFAULT_COMMAND = 'git ls-tree -r --name-only HEAD || rg --files'
    "nnoremap <silent> <leader>t :SK<CR>
    nnoremap <silent> <c-p> :SK<CR>
" }}}}
" Airline {{{{
    Plug 'vim-airline/vim-airline'
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
    " Plug 'davidhalter/jedi-vim'
" }}}}
" postgres syntax {{{{
    Plug 'lifepillar/pgsql.vim'
" }}}}
" Re Structured text {{{{
    Plug 'gu-fan/InstantRst'
    Plug 'gu-fan/riv.vim'
" }}}}
" Toml - not just cargo {{{{
    Plug 'cespare/vim-toml'
" }}}}
" LSP Config {{{{
    Plug 'neovim/nvim-lspconfig'
" }}}}
" Completion {{{{
    Plug 'hrsh7th/nvim-compe'
" }}}}

" NeoFormat {{{{
    Plug 'sbdchd/neoformat'
    " TODO configure
    let g:neoformat_enabled_python = [ 'black' ]
" }}}}
" Test {{{{
    Plug 'janko/vim-test'
    nnoremap <silent> tt :TestNearest<CR>
    nnoremap <silent> tf :TestFile<CR>
    nnoremap <silent> ts :TestSuite<CR>
    nnoremap <silent> tl :TestLast<CR>
    " TODO configure
    let test#strategy = "neovim"
    let test#neovim#term_position = "vertical"
    if has('nvim')
        tmap <C-o> <C-\><C-n>
    endif
" }}}}

" TreeSitter {{{{
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" }}}}

" color schemes {{{{
    " Plug 'joshdick/onedark.vim'
    " Plug 'tomasiser/vim-code-dark'
    " Plug 'rakr/vim-one'
    " Plug 'danilo-augusto/vim-afterglow'
    " Plug 'nightsense/carbonized'
    " Plug 'NLKNguyen/papercolor-theme'
    " Plug 'jacoborus/tender.vim'
    " Plug 'romainl/apprentice'
    " Plug 'rakr/vim-two-firewatch'
    " Plug 'tomasr/molokai'
    " Plug 'fcevado/molokai_dark'
    " Plug 'Heorhiy/VisualStudioDark.vim'
    " Plug 'chriskempson/base16-vim'
    Plug 'ayu-theme/ayu-vim'
" }}}}

call plug#end()
" }}}
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gni",
    },
  },
  indent = {
    enable = true
  }
}

require'lspconfig'.pyright.setup {}
require'lspconfig'.rust_analyzer.setup {}

-- hrsh7th/nvim-compe
require'compe'.setup { 
  enabled = true;
  autocomplete = true;
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- treesitter = true;
  };
}

EOF

" configuration for completion-nvim
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" configuration for compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR> compe#confirm('<CR>')

" configuration for the built in lsp 
" some of these are very close to the fugitive mappings
" I took them from dev on duty
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gS    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>

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

let g:python_host_prog = "~/.pyenv/versions/2.7.18/bin/python"  " Python 2
let g:python3_host_prog = "~/.pyenv/versions/3.8.5/bin/python"  " Python 3

