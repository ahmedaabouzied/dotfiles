-- Startify ASCII art and settings
vim.g.startify_custom_header = {
    ' +---------------------------------------------------------+',
    ' |                                                         |',
    ' |                                                         |',
    ' |                " GET OFF MY PROPERTY "                  |',
    ' |                                  - Fuzzy Lumpkins       |',
    ' |                                                         |',
    ' +---------------------------------------------------------+'
}

vim.g.startify_files_number = 5
vim.g.startify_list_order = {
    {'   My most recently used files in the current directory:'},
    'dir',
    {'   My most recently used files:'},
    'files',
    {'   These are my sessions:'},
    'sessions',
}
vim.g.startify_update_oldfiles = 1

-- Leader keys
vim.g.mapleader = "-"
vim.g.maplocalleader = ","

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

-- Configure plugins
require("lazy").setup({
        -- Theme and UI
        { "dracula/vim", name = "dracula" },
        "mhinz/vim-startify",
        {
            'bettervim/yugen.nvim',
            config = function()
                vim.cmd.colorscheme('yugen')
            end,
        },
        { 
            'olivercederborg/poimandres.nvim',
            lazy = false,
            priority = 1000,
            config = function()
                require('poimandres').setup {
                    -- leave this setup function empty for default config
                        -- or refer to the configuration section
                        -- for configuration options
                    }
                end,

                -- optionally set the colorscheme within lazy config
                init = function()
                    vim.cmd("colorscheme poimandres")
                end
            },
            {
                "vague2k/vague.nvim",
                config = function()
                end
            },
            {
                "catppuccin/nvim",
                name = "catppuccin",
                priority = 1000,
                opts = {
                    no_italic = true,
                    term_colors = true,
                    transparent_background = false,
                    styles = {
                        comments = {},
                        conditionals = {},
                        loops = {},
                        functions = {},
                        keywords = {},
                        strings = {},
                        variables = {},
                        numbers = {},
                        booleans = {},
                        properties = {},
                        types = {},
                    },
                    color_overrides = {
                        mocha = {
                            base = "#000000",
                            mantle = "#000000",
                            crust = "#000000",
                        },
                    },
                    integrations = {
                        telescope = {
                            enabled = true,
                            style = "nvchad",
                        },
                        dropbar = {
                            enabled = true,
                            color_mode = true,
                        },
                    },
                },
            },

            -- Buffer line
            {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

            -- Status Line
            {
                'nvim-lualine/lualine.nvim',
                dependencies = { 'nvim-tree/nvim-web-devicons' }
            },
            {
                "lukas-reineke/indent-blankline.nvim",
                main = "ibl",
                ---@module "ibl"
                ---@type ibl.config
                opts = {},
            },

            -- File navigation and utilities
            "scrooloose/nerdtree",
            "scrooloose/nerdcommenter",
            "alvan/vim-closetag",
            {
                "junegunn/fzf",
                build = "./install --all"
            },
            "junegunn/fzf.vim",

            -- Development tools
            "chrisbra/Colorizer",
            "wakatime/vim-wakatime",
            "sheerun/vim-polyglot",

            -- Additional themes
            "haishanh/night-owl.vim",
            "ajmwagar/vim-deus",
            "KeitaNakamura/neodark.vim",

            -- LSP and completion
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                config = function () 
                    local configs = require("nvim-treesitter.configs")

                    configs.setup({
                            ensure_installed = { "c", "lua", "javascript", "html", "go", "rust" },
                            sync_install = false,
                            highlight = { enable = true },
                            indent = { enable = true },  
                        })
                end
            },

            -- Code review
            "junkblocker/patchreview-vim",
            "codegram/vim-codereview",
            -- AI 
            {
                'Exafunction/codeium.vim',
                event = 'BufEnter'
            },
        }) -- End lazy.nvim


    -- Colors and highlighting
    vim.cmd('syntax on')
    vim.cmd.colorscheme('catppuccin')
    vim.opt.termguicolors = true

    -- General settings
    vim.opt.conceallevel = 0
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.smarttab = true
    vim.opt.autoindent = true
    vim.opt.incsearch = true
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.hlsearch = true
    vim.opt.ruler = true
    vim.opt.laststatus = 2
    vim.opt.showcmd = true
    vim.opt.showmode = true
    vim.opt.wrap = true
    vim.opt.breakindent = true
    vim.opt.encoding = 'utf-8'
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.title = true
    vim.opt.splitbelow = true
    vim.opt.splitright = true
    vim.opt.winborder = "rounded"

    -- NERDTree settings
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeDirArrowExpandable = '↠'
    vim.g.NERDTreeDirArrowCollapsible = '↡'

    -- Lualine status line settings
    require('lualine').setup()

    -- Buffer line
    require("bufferline").setup{}

    -- IndentLine settings
    vim.g.indentLine_char_list = {'|', '¦', '┆', '┊'}
    vim.g.indentLine_color_term = 239
    vim.g.indentLine_color_gui = '#6a342c'

    -- FZF settings
    vim.g.fzf_action = {
        ['ctrl-t'] = 'tab split',
        ['ctrl-s'] = 'split',
        ['ctrl-v'] = 'vsplit'
    }

    -- Key mappings
    -- Insert mode mappings
    vim.api.nvim_set_keymap('i', '(', '()<left>', {noremap = true})
        vim.api.nvim_set_keymap('i', '[', '[]<left>', {noremap = true})
        vim.api.nvim_set_keymap('i', '{', '{}<left>', {noremap = true})
            vim.api.nvim_set_keymap('i', '<c-v>', '"*p', {noremap = true})

            -- Normal mode mappings
            vim.api.nvim_set_keymap('n', '<c-n>', ':NERDTreeToggle<CR>', {noremap = true})

            -- NERD Commenter settings
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDCompactSexyComs = 1
            vim.g.NERDDefaultAlign = 'left'
            vim.g.NERDAltDelims_java = 1
            vim.g.NERDCustomDelimiters = { c = { left = '/**', right = '*/' } }
            vim.g.NERDCommentEmptyLines = 1
            vim.g.NERDTrimTrailingWhitespace = 1
            vim.g.NERDToggleCheckAllLines = 1

            -- Load additional Lua configurations
            require('lsp')
            require('completion')
            require('helpers')
