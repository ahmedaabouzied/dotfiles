" VIM Configuration file 
" Author : Ahmed Abouzied <ahmedaabouzied.github.io>

" Startify ascii art {{{
augroup filetype_vim
    let g:startify_custom_header = [                                                                    
        \ '',                                                                                        
        \ '',                                                                                        
        \ '     VVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM     ',          
        \ '     V::::::V           V::::::VI::::::::IM:::::::M             M:::::::M     ',          
        \ '     V::::::V           V::::::VI::::::::IM::::::::M           M::::::::M     ',          
        \ '     V::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::M     ',          
        \ '      V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M     ',          
        \ '       V:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M     ',          
        \ '        V:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M     ',          
        \ '         V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M     ',          
        \ '          V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M     ',          
        \ '           V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M     ',          
        \ '            V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M     ',          
        \ '             V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M     ',          
        \ '              V:::::::V         II::::::IIM::::::M               M::::::M     ',          
        \ '               V:::::V          I::::::::IM::::::M               M::::::M     ',          
        \ '                V:::V           I::::::::IM::::::M               M::::::M     ',          
        \ '                 VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM     ',          
        \ '',                                                                                        
        \ '',                                                                                        
        \'                      ____    ____   _    _  ______ _____  ______  _____       ',
        \'               /\    |  _ \  / __ \ | |  | ||___  /|_   _||  ____||  __ \      ',
        \'              /  \   | |_) || |  | || |  | |   / /   | |  | |__   | |  | |     ',
        \'             / /\ \  |  _ < | |  | || |  | |  / /    | |  |  __|  | |  | |     ',
        \'            / ____ \ | |_) || |__| || |__| | / /__  _| |_ | |____ | |__| |     ',
        \'           /_/    \_\|____/  \____/  \____/ /_____||_____||______||_____/      ',
        \''
        \'',
        \ ]
augroup END
" }}}

" Startify settings {{{
augroup filetype_vim
    let g:startify_files_number = 5                                                                      
    let g:startify_list_order = [                                                                        
          \ ['   My most recently used files in the current directory:'],                                
          \ 'dir',                                                                                      
          \ ['   My most recently used files:'],                                                        
          \ 'files',                                                                                    
          \ ['   These are my sessions:'],                                                              
          \ 'sessions',                                                                                  
          \ ]                                                                                            
    let mapleader = "-"
    let g:startify_update_oldfiles=1                                              
augroup END
" }}}

" Auto Commands {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    let g:rustfmt_autosave = 1
augroup END
" }}}

" File type {{{
augroup filetype_vim
    filetype on
    filetype indent on
    filetype plugin on
    filetype plugin indent on
augroup END
" }}}

" Leaders {{{
augroup filetype_vim
    let mapleader = "-"
    let maplocalleader = ","
augroup END
" }}}

" Insert Mode key Mappings {{{
augroup filetype_vim
    inoremap <expr> <Tab> ((pumvisible())?("\<C-n>"):("j"))
    inoremap <expr> <S-Tab> ((pumvisible())?("\<C-p>"):("k"))
    " inoremap " ""<left>
    " inoremap ' ''<left>
    inoremap ( ()<left>
    inoremap [ []<left>
    inoremap { {}<left>
    inoremap <c-v> "*p

    " skip over closing grouping symbols
    inoremap <expr> ] getline('.')[getpos('.')[2] - 1] == ']' ? '<Right>' : ']'
    inoremap <expr> ) getline('.')[getpos('.')[2] - 1] == ')' ? '<Right>' : ')'
    inoremap <expr> } getline('.')[getpos('.')[2] - 1] == '}' ? '<Right>' : '}'
augroup END
" }}}

" Normal Mode Key Mappings{{{
augroup filetype_vim
    nnoremap <c-n> :NERDTreeToggle<CR>
    nnoremap<silent> <buffer> <Leader>h : <C-u>call GOVIMHover()<CR>
    nnoremap <silent> K :call <SID>show_documentation()<CR>
augroup END
" }}}

" Global Settings {{{
augroup filetype_vim

    set nocompatible
    set enc=utf-8
    set termencoding=utf-8
    " disable vi compatibility (emulation of old bugs)
    set nocompatible
    " use indentation of previous line
    set autoindent
    " use intelligent indentation for C
    set smartindent
    " no swap files 
    set nowrap
    set nowritebackup
    set noswapfile
    set mouse=v
    " configure tabwidth and insert spaces instead of tabs
    set tabstop=2        " tab width is 4 spaces
    set shiftwidth=4     " indent also with 4 spaces
    set expandtab        " expand tabs to spaces
    " wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
    set textwidth=120
    " turn syntax highlighting on
    set t_Co=256
    set ttymouse=sgr
    set updatetime=500
    set balloondelay=250
    set signcolumn=yes
    """" enable 24bit true color
    set termguicolors
    " turn line numbers on
    set number
    " highlight matching braces
    " intelligent comments
    set comments=sl:/*,mb:\ *,elx:\ */
    set clipboard=unnamed
    set nocompatible
    set backspace=indent,eol,start
augroup END
" }}}

" Vundle Plugins {{{
augroup filetype_vim
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call plug#begin('~/.vim/plugged')
    
    Plug 'scrooloose/nerdtree'
    Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plug 'wakatime/vim-wakatime'
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdcommenter'
    Plug 'myitcv/govim'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'junegunn/fzf.vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }

    call plug#end()
    " To ignore plugin indent changes, instead use:
    "
    " Brief help
    " :PlugList       - lists configured plugins
    " :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
    " :PlugSearch foo - searches for foo; append `!` to refresh local cache
    " :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plug stuff after this line
augroup END
" }}}

" Syntax Highlighting {{{
augroup filetype_vim
    syntax on
    syntax enable
augroup END
" }}}

" Fuzzy Finder Plugin Setup {{{
augroup filetype_vim
    set rtp+=~/.fzf 
augroup END
" }}}

" Color Scheme {{{
augroup filetype_vim
    colorscheme dracula
augroup END
" }}}

" Airline Plugin Setup {{{
    let g:airline_powerline_fonts = 1
" }}}

" GVIM Specific Setup {{{
augroup filetype
    if has("gui_running")
        "" Set Font
        set guifont=Source\ Code\ Pro\ regular\ 14
        "" Maximize Vim
        set columns=999 lines=999
    endif
    
    if has("patch-8.1.1904")
        set completeopt+=popup
        set completepopup=align:menu,border:off,highlight:Pmenu
    endif
augroup END
" }}}

" Commenting Helper {{{
augroup filetype_vim
    autocmd FileType javascript nnoremap <buffer> <localleader>/ I// <esc>
augroup END
" }}}

" Vim COC settings {{{
    " if hidden is not set, TextEdit might fail.
    set hidden
    
    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup
    
    " Better display for messages
    set cmdheight=2
    
    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300
    
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    
    " always show signcolumns
    set signcolumn=yes
    
    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
    inoremap <silent><expr> <c-space> coc#refresh()
    
    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    
    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    
    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
    
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
    
    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)
    
    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    
    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    
    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    
    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)
    
    " Create mappings for function text object, requires document symbols feature of languageserver.
    
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)
    
    " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
    
    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    
    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    
    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    
    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>zaza
" }}}

" NERD COMMENTER {{{
augroup NERD_commenter_plugin

let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1 
augroup END
" }}}
