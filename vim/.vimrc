" vim:fdm=marker
" Initialization {{{
let mapleader=","
" }}}
"
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Vim Plug plugin list {{{
    call plug#begin('~/.local/share/nvim/plugged~/.vim/plugged')
" Fugitive {{{{
    Plug 'https://github.com/tpope/vim-fugitive.git'
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
    Plug 'https://github.com/tpope/vim-surround'
" }}}}
" GitGutter {{{{
    Plug 'https://github.com/airblade/vim-gitgutter'
" }}}}
" Tmux navigator {{{{
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
" }}}}
" NerdTree {{{{
    Plug 'https://github.com/scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
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
    Plug 'https://github.com/scrooloose/nerdcommenter'
    Plug 'tpope/vim-commentary'
" }}}}
" DBExt {{{{
    Plug 'https://github.com/vim-scripts/dbext.vim'
    source $HOME/.psql.vim
" }}}}
" dadbod {{{{
    Plug 'https://github.com/tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui'
    source $HOME/.dadbod-db.vim

    " }}}}
" dadbod {{{{
    Plug 'https://github.com/tpope/vim-dotenv'
" }}}}
" RipGrep {{{{
    Plug 'https://github.com/jremmen/vim-ripgrep'
    let g:rg_command = 'rg --hidden --vimgrep'
" }}}}
" Tabularize {{{{
    Plug 'https://github.com/godlygeek/tabular'
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
" SKIM {{{{"
    Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
    Plug 'lotabout/skim'
        "let g:ctrlp_map = '<c-t>'
        "let $FZF_DEFAULT_COMMAND = 'rg --hidden --files'
        "let $SK_DEFAULT_COMMAND = 'rg --hidden --files'
        nnoremap <silent> <leader>t :SK<CR>
        nnoremap <silent> <c-p> :SK<CR>
" }}}}
" airline and bufferline {{{{
    Plug 'https://github.com/bling/vim-airline'
" }}}}
" Json syntax {{{{
    Plug 'https://github.com/elzr/vim-json'
" }}}}
" PlantUml syntax {{{{
    "Plug 'https://github.com/aklt/plantuml-syntax'
    "let g:plantuml_executable_script='java -jar /usr/local/Cellar/plantuml/8041/plantuml.8041.jar'
" }}}}
" Rainbow parens syntax {{{{
    Plug 'https://github.com/luochen1990/rainbow'
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" }}}}
" EditorConfig {{{{
    Plug 'https://github.com/editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']
    let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
    let g:EditorConfig_core_mode = 'external_command'
"}}}}}
" Vim Kotlin {{{{
    Plug 'https://github.com/udalov/kotlin-vim'
"}}}}
" ALE {{{{
    Plug 'https://github.com/dense-analysis/ale'
    "let g:ale_kotlin_languageserver_executable='/Users/z001rw6/work/KotlinLanguageServer/build/install/kotlin-language-server/bin/kotlin-language-server'
    " let g:ale_kotlin_languageserver_executable='/Users/z001rw6/work/KotlinLanguageServer/server/build/install/server/bin/kotlin-language-server'
    let g:ale_python_auto_pipenv=1
" }}}}
" Go {{{{
    "let g:http_client_verify_ssl=0
    "Plug 'https://github.com/fatih/vim-go'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"}}}}}
" rust-lang/rust.vim {{{{
    Plug 'rust-lang/rust.vim'
"}}}}}
" postgres syntax {{{{
    Plug 'lifepillar/pgsql.vim'
"}}}}}
" Re Structured text {{{{
    Plug 'gu-fan/InstantRst'
    Plug 'gu-fan/riv.vim'
"}}}}}
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
    Plug 'https://github.com/joshdick/onedark.vim'
    Plug 'https://github.com/tomasiser/vim-code-dark'
    Plug 'https://github.com/tomasr/molokai'
    Plug 'danilo-augusto/vim-afterglow'
    Plug 'nightsense/carbonized'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'jacoborus/tender.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'ayu-theme/ayu-vim'
"}}}}}

call plug#end()


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
require'lspconfig'.kotlin_language_server.setup{}

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

-- nvim-compe tab completion
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
--  elseif vim.fn.call("vsnip#available", {1}) == 1 then
--    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
--  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
--    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- end nvim-compe tab completion


EOF



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
        color ayu
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
let g:python3_host_prog = '/Users/z001rw6/.pyenv/versions/3.7.7/bin/python3.7'  " Python 3

