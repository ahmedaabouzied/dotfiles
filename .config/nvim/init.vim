" NEOVIM CONFIGURATION FILE
" AUTHOR : Ahmed Abouzied <ahmedaabouzied.github.io>
"
"" Startify ascii art {{{
augroup filetype_vim
    let g:startify_custom_header = [
                \' +---------------------------------------------------------+',
                \' |                                                         |',
                \' |                                                         |',
                \' |                " GET OFF MY PROPERTY "                  |',
                \' |                                  - Fuzzy Lumpkins       |',
                \' |                                                         |',
                \' +---------------------------------------------------------+'
                \]
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

" Leaders {{{
augroup filetype_vim
    let mapleader = "-"
    let maplocalleader = ","
augroup END
" }}}

" Plugins {{{
augroup filetype_vim

    call plug#begin()

    Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'alvan/vim-closetag'
    Plug 'Yggdroot/indentLine'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'chrisbra/Colorizer'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'wakatime/vim-wakatime'
    Plug 'sheerun/vim-polyglot'
    Plug 'dense-analysis/ale'
    Plug 'haishanh/night-owl.vim'
    Plug 'ajmwagar/vim-deus'
    Plug 'KeitaNakamura/neodark.vim'
    call plug#end()

augroup END
" }}}

" Highlighting and colors {{{
augroup filetype_vim
    syntax on
    colorscheme neodark
    " highlight Pmenu guibg= guifg=white gui=bold
    " highlight Normal gui=none
    " highlight NonText guibg=none

    " Opaque Background (Comment out to use terminal's profile)
    set termguicolors

    " Transparent Background (For i3 and compton)
    " highlight Normal guibg=NONE ctermbg=NONE
    " highlight LineNr guibg=NONE ctermbg=NONE
    " highlight Comment gui=italic cterm=italic

augroup END
"}}}

" Configurations {{{
augroup filetype_vim
    filetype plugin indent on
    set conceallevel=0
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
    set incsearch ignorecase smartcase hlsearch
    set ruler laststatus=2 showcmd showmode
    set wrap breakindent
    set encoding=utf-8
    set number
    set title
augroup END
" }}}

" NERDTree {{{
augroup filetype_vim
    let NERDTreeShowHidden=1
    let g:NERDTreeDirArrowExpandable = '↠'
    let g:NERDTreeDirArrowCollapsible = '↡'
augroup END
"}}}

" COC.nvim Configurations {{{
augroup filetype_vim
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

    " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <C-d> <Plug>(coc-range-select)
    xmap <silent> <C-d> <Plug>(coc-range-select)

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
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
augroup END
" }}}

" Airline {{{
augroup filetype_vim
    let g:airline_powerline_fonts = 1
    let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
    let g:airline_section_warning = ''
    "let g:airline#extensions#tabline#enabled = 1
augroup END
" }}}

" EasyAlign {{{
augroup filetype_vim
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
augroup END
"}}}

" IndentLine {{{
augroup filetype_vim
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#6a342c'
    " let g:indentLine_conceallevel = 0

augroup END
"}}}

" TagBar {{{
augroup filetype_vim
    let g:tagbar_width = 30
augroup END
" }}}

" fzf-vim {{{
augroup filetype_vim
    let g:fzf_action = {
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-s': 'split',
                \ 'ctrl-v': 'vsplit' }
    let g:fzf_colors =
                \ { 'fg':      ['fg', 'Normal'],
                \ 'bg':      ['bg', 'Normal'],
                \ 'hl':      ['fg', 'Comment'],
                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                \ 'hl+':     ['fg', 'Statement'],
                \ 'info':    ['fg', 'Type'],
                \ 'border':  ['fg', 'Ignore'],
                \ 'prompt':  ['fg', 'Character'],
                \ 'pointer': ['fg', 'Exception'],
                \ 'marker':  ['fg', 'Keyword'],
                \ 'spinner': ['fg', 'Label'],
                \ 'header':  ['fg', 'Comment'] }
augroup END
" }}}

" Insert Mode key Mappings {{{
augroup filetype_vim
    " inoremap <expr> <Tab> ((pumvisible())?("\<C-n>"):("j"))
    " inoremap <expr> <S-Tab> ((pumvisible())?("\<C-p>"):("k"))
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

" Commenting Helper {{{
augroup filetype_vim
    autocmd FileType javascript nnoremap <buffer> <localleader>/ I// <esc>
augroup END
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

" Prettier Config {{{
" augroup Prettier
"    let g:prettier#autoformat = 0
"    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.en.js PrettierAsync
" augroup END
" }}}

" Vim ALE Config {{{
augroup Ale
    let g:ale_java_google_java_format_executable = "/home/ahmedaabouzied/.java/bin/google-java-format.jar"
    let g:ale_linters_ignore = {'typescript': ['tslint', 'tsserver']}
    let g:ale_linters = {
                \       'java': ['eclipselsp'],
                \    }
    let g:ale_fix_on_save = 1
    let g:ale_fixers = {
                \       '*': ['remove_trailing_lines', 'trim_whitespace'],
                \       'javascript': ['prettier'],
                \       'html' :['prettier'],
                \       'typescript': ['tslint'],
                \       'c': ['clang-format'],
                \       'markdown': ['prettier'],
                \       'java':['google_java_format'],
                \}
augroup END
" }}}

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
