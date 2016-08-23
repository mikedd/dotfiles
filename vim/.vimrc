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
        map <silent> <F2> :NERDTreeToggle <CR>
" }}}}
" NerdCommenter {{{{
    Plug 'git@github.com:scrooloose/nerdcommenter'
" }}}}
" Syntastic {{{{
    Plug 'git@github.com:scrooloose/syntastic'
    " Can't trust fsc to work properly
    let g:syntastic_mode_map = { 'passive_filetypes': ['scala'] }
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
    "Plug 'git@github.com:Valloric/YouCompleteMe', { 'do': './install.sh' }
" }}}}
" JavaComplete {{{{
    Plug 'git@github.com:vim-scripts/javacomplete', { 'for' : 'java' }
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
    let g:dbext_default_profile_EDW = 'type=ODBC:user=z001rw6:dsnname=EDW'
" }}}}
" Ag - quick grep {{{{
    Plug 'git@github.com:rking/ag.vim'
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
    Plug 'git@github.com:kien/ctrlp.vim'
        let g:ctrlp_map = '<c-t>'
" }}}}
" ZenCoding for fast HTML completions {{{{
    Plug 'git@github.com:mattn/emmet-vim'
" }}}}
" {{{{ airline and bufferline
    Plug 'git@github.com:bling/vim-airline'
    "Plug 'git@github.com:bling/vim-bufferline'
" }}}}
"
" Mustang-vim color scheme {{{{
    Plug 'git@github.com:croaker/mustang-vim'
" }}}}

" xoria256-vim color scheme {{{{
    Plug 'git@github.com:vim-scripts/xoria256.vim'
" }}}}

" Vinegar netrw enhancement {{{{
    Plug 'git@github.com:tpope/vim-vinegar'
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

" NGINX syntax {{{{
    " This script is maintained in NGXIN under the contrib directory 
    " nginx uses hg though so this is likely out of date
    Plug 'git@github.com:evanmiller/nginx-vim-syntax'
" }}}}

" Rainbow parens syntax {{{{
    Plug 'git@github.com:luochen1990/rainbow'
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" }}}}


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
" Status line {{{
    if has('statusline')
        "statusline setup
        set statusline =%#identifier#
        set statusline+=[%t] "tail of the filename
        set statusline+=%*
        "display a warning if fileformat isnt unix
        set statusline+=%#warningmsg#
        set statusline+=%{&ff!='unix'?'['.&ff.']':''}
        set statusline+=%*
        "display a warning if file encoding isnt utf-8
        set statusline+=%#warningmsg#
        set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
        set statusline+=%*
        set statusline+=%h "help file flag
        set statusline+=%y "filetype
        "read only flag
        set statusline+=%#identifier#
        set statusline+=%r
        set statusline+=%*
        "modified flag
        set statusline+=%#identifier#
        set statusline+=%m
        set statusline+=%*
        set statusline+=%{fugitive#statusline()}
        "display a warning if &et is wrong, or we have mixed-indenting
        set statusline+=%#error#
        set statusline+=%{StatuslineTabWarning()}
        set statusline+=%*
        set statusline+=%{StatuslineTrailingSpaceWarning()}
        "set statusline+=%{StatuslineLongLineWarning()}
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        "set statusline+=%*
        "display a warning if &paste is set
        set statusline+=%#error#
        set statusline+=%{&paste?'[paste]':''}
        set statusline+=%*
        set statusline+=%= "left/right separator
        "set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
        set statusline+=%c, "cursor column
        set statusline+=%l/%L "cursor line/total lines
        set statusline+=\ %P "percent through file
        set laststatus=2

        "recalculate the trailing whitespace warning when idle, and after saving
        autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

        "return '[\s]' if trailing white space is detected
        "return '' otherwise
        function! StatuslineTrailingSpaceWarning()
            if !exists("b:statusline_trailing_space_warning")
                if !&modifiable
                    let b:statusline_trailing_space_warning = ''
                    return b:statusline_trailing_space_warning
                endif
                if search('\s\+$', 'nw') != 0
                    let b:statusline_trailing_space_warning = '[\s]'
                else
                    let b:statusline_trailing_space_warning = ''
                endif
            endif
            return b:statusline_trailing_space_warning
        endfunction

        "return the syntax highlight group under the cursor ''
        function! StatuslineCurrentHighlight()
            let name = synIDattr(synID(line('.'),col('.'),1),'name')
            if name == ''
                return ''
            else
                return '[' . name . ']'
            endif
        endfunction

        "recalculate the tab warning flag when idle and after writing
        autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

        "return '[&et]' if &et is set wrong
        "return '[mixed-indenting]' if spaces and tabs are used to indent
        "return an empty string if everything is fine
        function! StatuslineTabWarning()
            if !exists("b:statusline_tab_warning")
                let b:statusline_tab_warning = ''
                if !&modifiable
                    return b:statusline_tab_warning
                endif
                let tabs = search('^\t', 'nw') != 0
                "find spaces that arent used as alignment in the first indent column
                let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
                if tabs && spaces
                    let b:statusline_tab_warning = '[mixed-indenting]'
                elseif (spaces && !&et) || (tabs && &et)
                    let b:statusline_tab_warning = '[&et]'
                endif
            endif
            return b:statusline_tab_warning
        endfunction
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
    autocmd Filetype java setlocal tabstop=2          "Tab width = 2"
    autocmd Filetype java setlocal shiftwidth=2       "Auto indent = 2"
    autocmd Filetype java setlocal softtabstop=2      "Backspace will delete two spaces for auto-indenting"
    autocmd Filetype java setlocal expandtab          "Use spaces instead of tabs"

    "{{{{ Chef & Other devops cruft}}}}
    autocmd BufNewFile,BufRead Gemfile set filetype=ruby
    autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
    autocmd BufNewFile,BufRead Berksfile set filetype=ruby

    "{{{{ plantuml }}}}
    autocmd Filetype plantuml let s:makecommand='java -jar /usr/local/Cellar/plantuml/8031/plantuml.8031.jar %'

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
" Cscope {{{
     " {{{{ Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    " }}}}

    " show msg when any other cscope db added
    set cscopeverbose
    " {{{{ My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "
    " }}}}

    " {{{{ No split
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    " }}}}


    " {{{{ Horizontal split
    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
    " }}}}


    " {{{{ Vertical  split
    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    " }}}}
" }}}
