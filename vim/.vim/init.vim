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
set completeopt=menuone,noinsert,noselect  " From devOnDuty
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
    Plug 'davidhalter/jedi-vim'
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
" Conqueror Of Completion {{{{
    Plug 'neoclide/coc.nvim'

    " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    " set nobackup
    " set nowritebackup

    " Give more space for displaying messages.
    " set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    " command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
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
EOF


set background=dark
color ayu
" }}}
" General Configuration {{{

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

