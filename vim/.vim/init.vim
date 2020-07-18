" vim:fdm=marker
" General configuration {{{
    set showmode                    " Display the current mode
    " set cursorline                  " Highlight current line
    " set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          "show line numbers
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
"
if has("termguicolors")
  set termguicolors
endif

" Vim Plug plugin list {{{
call plug#begin('~/.local/share/nvim/plugged')
" Tmux navigator {{{
    Plug 'git@github.com:christoomey/vim-tmux-navigator'
        " Helps with background color in tmux
        set t_Co=256
        set t_ut=
" }}}
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
" Surround {{{
    Plug 'git@github.com:tpope/vim-surround'
" }}}
" GitGutter {{{
    Plug 'git@github.com:airblade/vim-gitgutter'
" }}}
" NerdTree {{{
    Plug 'git@github.com:scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
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
" commenting {{{
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-commentary'
" }}}
" DBExt {{{
    Plug 'git@github.com:vim-scripts/dbext.vim'
    source $HOME/.psql.vim
" }}}
" ripgrep {{{
    Plug 'git@github.com:jremmen/vim-ripgrep'
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
" SKIM {{{
    Plug 'lotabout/skim.vim', { 'dir': '~/.skim', 'do': './install' }
    Plug 'lotabout/skim'
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
    "nnoremap <silent> <leader>t :SK<CR>
    nnoremap <silent> <c-p> :SK<CR>
" }}}
" Airline {{{
    Plug 'git@github.com:bling/vim-airline'
" }}}
" json {{{
    Plug 'git@github.com:elzr/vim-json'
" }}}
" rainbow parens {{{
    Plug 'git@github.com:luochen1990/rainbow'
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" }}}
" EditorConfig {{{
    Plug 'git@github.com:editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns=[ 'fugitive://.*' ]
    let g:EditorConfig_exec_path='/usr/local/bin/editorconfig'
    let g:EditorConfig_code_mode='external_command'
" }}}
" Kotlin {{{
    Plug 'git@github.com:udalov/kotlin-vim'
" }}}
" ALE {{{
    Plug 'git@github.com:dense-analysis/ale'
    let g:ale_kotlin_languageserver_executable='/home/mikedd/work/KotlinLanguageServer/build/install/kotlin-language-server/bin/kotlin-language-server'
" }}}
" Rust {{{
    Plug 'git@github.com:rust-lang/rust.vim'
" }}}
" Tagbar {{{
    Plug 'majutsushi/tagbar'
" }}}
" Coc {{{
    Plug 'neoclide/coc.nvim', {'tag': '*' , 'branch': 'release', 'for': ['rust'] }
    set cmdheight=2
    set updatetime=300
    set shortmess+=c
    if has("patch-8.1.1564")
      set signcolumn=number
    else
      set signcolumn=yes
    endif
    inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
   
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
    "autocmd CursorHold * silent call CocActionAsync('highlight')

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
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

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


" }}}
" Syntasitc {{{
    "Plug 'vim-syntastic/syntastic'
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*

    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    "let g:syntastic_check_on_open = 1
    "let g:syntastic_check_on_wq = 0
" }}}
" Colors {{{
    Plug 'tomasiser/vim-code-dark'
    Plug 'rakr/vim-one'
    Plug 'jacoborus/tender.vim'
    Plug 'romainl/apprentice'
    Plug 'rakr/vim-two-firewatch'
    Plug 'tomasr/molokai'
    Plug 'fcevado/molokai_dark'
    Plug 'joshdick/onedark.vim'
    Plug 'Heorhiy/VisualStudioDark.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'ayu-theme/ayu-vim'
" }}}
call plug#end()
" }}}
" General Configuration {{{
filetype plugin indent on
syntax on

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
    set complete=.,w,b,u,t,i

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
let g:python_host_prog = "~/.pyenv/versions/2.7.17/bin/python"  " Python 2
let g:python3_host_prog = "~/.pyenv/versions/3.8.2/bin/python"  " Python 3
