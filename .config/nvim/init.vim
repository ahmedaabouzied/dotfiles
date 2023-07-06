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
    " autocmd BufWritePre * lua vim.lsp.buf.formatting()
    command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen 33
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

    Plug 'neovim/nvim-lspconfig' " Neovim LSP
    Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'alvan/vim-closetag'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'chrisbra/Colorizer'
    Plug 'wakatime/vim-wakatime'
    Plug 'sheerun/vim-polyglot'
    Plug 'dense-analysis/ale'
    Plug 'haishanh/night-owl.vim'
    Plug 'ajmwagar/vim-deus'
    Plug 'KeitaNakamura/neodark.vim'

    " Completions
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " Code review
    Plug 'junkblocker/patchreview-vim'
    Plug 'codegram/vim-codereview'

    call plug#end()
augroup END
" }}}

" Highlighting and colors {{{
augroup filetype_vim
    syntax on
    colorscheme night-owl
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
    " Relative Line Numbers
    set relativenumber
    set rnu
    set splitbelow
    set splitright
    " Show syntax highlighting groups for word under cursor
    nmap <C-S-P> :call <SID>SynStack()<CR>
    function! <SID>SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc
augroup END
" }}}

" NERDTree {{{
augroup filetype_vim
    let NERDTreeShowHidden=1
    let g:NERDTreeDirArrowExpandable = '↠'
    let g:NERDTreeDirArrowCollapsible = '↡'
augroup END
" }}}

" NeovimLSP {{{
augroup filetype vim
    luafile ~/.config/nvim/lsp.lua
    luafile ~/.config/nvim/completion.lua
    luafile ~/.config/nvim/helpers.lua
augroup end
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
    " nnoremap <silent> K :call <SID>show_documentation()<CR>
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
                \       'go':   ['gopls'],
                \    }
    let g:ale_fix_on_save = 0
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
