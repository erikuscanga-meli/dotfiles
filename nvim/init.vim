" ============ General settings ============

syntax enable
set noerrorbells
set scrolloff=5     " minimal amount of screen lines to keep above and below the cursor
set number          " line numbers
set history=1000    " store :cmd history
set showmatch       " highlight matched brackets, also jumps to the matching one
set matchtime=1     " time between matching bracket jump
set nowrap
set encoding=UTF-8

" ============ Search settings ============

set nohlsearch      " no highlight searching result
" set incsearch
set smartcase

" ============ Optional settings ============

set relativenumber  " show relative number from current line
set cursorline      " highlight cursor line
set mouse=h         " enable mouse in help mode

syntax sync minlines=200    " speed-up vim
set clipboard+=unnamed
set clipboard+=unnamedplus  " yank, paste to system clipboard
set noshowmode
set splitbelow splitright   " open new split view below (horizontal) or right (vertical) always
set wildmode=longest,list,full
set completeopt=menu,menuone,noselect

" ============ Appearance ============

set guicursor=
set colorcolumn=130
set background=dark
set laststatus=2
set termguicolors

" ============ Turn off swap ============

set noswapfile
set nobackup
set writebackup

" ============ Indentation ============

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" ============ Tab & space ============

set list
set listchars=tab:>·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:·
set listchars+=space:·
set fillchars+=vert:\│  " Make vertical split separator full linel

" ============ Persisten undo ============

if has("persistent_undo")
    let target_path = "~/.config/nvim/backups"
    " create the directory and any parent directories
    " if the location does not exists
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" ============ Plug-ins ============

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'Shadorain/shadotheme'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'jiangmiao/auto-pairs'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

" latte, frappe, macchiato, mocha
let g:catppuccin_flavour="mocha"
colorscheme catppuccin

filetype plugin on

let g:lightline={ 'colorscheme': 'catppuccin' }
let g:mapleader=" "

if !has('gui_running')
    set t_Co=256
endif

let g:loaded_node_provider=0
let g:loaded_perl_provider=0
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:ctrlp_use_caching=0
let g:netrw_winsize=25

nnoremap <leader>w <cmd>w<CR>
nnoremap <leader>q <cmd>q!<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :wincmd q<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap <silent> <leader>t :20sp<bar> :terminal<CR>
nnoremap <silent> <leader>s :vs<bar> :terminal<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Telescope fuzzy find keybindings
nnoremap <silent> <leader>ff <cmd>Telescope find_files<CR>
nnoremap <silent> <leader>fo <cmd>Telescope oldfiles<CR>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <silent> <leader>fr <cmd>Telescope registers<CR>
nnoremap <silent> <leader>fm <cmd>Telescope marks<CR>
nnoremap <silent> <leader>cf <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <leader>qf <cmd>Telescope quickfix<CR>
nnoremap <silent> <leader>qh <cmd>Telescope quickfixhistory<CR>
nnoremap <silent> <leader>sg <cmd>Telescope spell_suggest<CR>
nnoremap <silent> <leader>hl <cmd>Telescope highlights<CR>

" Telescope LSP keybinding
nnoremap <silent> <leader>lr <cmd>Telescope lsp_references<CR>
nnoremap <silent> <leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ls <cmd>Telescope lsp_document_symbols<CR>
nnoremap <silent> <leader>lw <cmd>Telescope lsp_workspace_symbols<CR>
nnoremap <silent> <leader>li <cmd>Telescope lsp_implementations<CR>
nnoremap <silent> <leader>ld <cmd>Telescope lsp_definitions<CR>
nnoremap <silent> <leader>lt <cmd>Telescope lsp_type_definitions<CR>

vnoremap <silent> <leader>lca <cmd>lua vim.lsp.buf.range_code_action()<CR>

" Telescope git keybindings
nnoremap <silent> <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <silent> <leader>gt <cmd>Telescope git_bcommits<CR>
nnoremap <silent> <leader>gb <cmd>Telescope git_branches<CR>
nnoremap <silent> <leader>gs <cmd>Telescope git_status<CR>
nnoremap <silent> <leader>gh <cmd>Telescope git_stash<CR>

" Telescope treesitter keybindings
nnoremap <silent> <leader>ts <cmd>Telescope treesitter<CR>

" Nerdtree keybindings
nnoremap <leader>n <cmd>NERDTreeFocus<CR>
nnoremap <C-n> <cmd>NERDTree<CR>
nnoremap <C-t> <cmd>NERDTreeToggle<CR>
nnoremap <C-f> <cmd>NERDTreeFind<CR>

" Misc keybindings
nnoremap <silent> <leader>bd <cmd>bd<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap jj <Esc><Esc>
inoremap JJ <Esc><Esc>

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

tnoremap <Esc> <C-\><C-n>

lua <<EOF
require'nvim-lsp-installer'.setup{
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
    },
}

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
    }, {
        { name = "buffer" }
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "buffer" }
    }, {
        { name = "cmdline" }
    })
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require'cmp_nvim_lsp'.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require'lspconfig'
local util = require'lspconfig/util'

lspconfig.bashls.setup{
    cmd = { "bash-language-server", "start" },
    cmd_env = { GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)" },
    filetypes = { "sh" },
    root_dir = util.find_git_ancestor,
    single_file_support = true,
    capabilities = capabilities,
}

lspconfig.dockerls.setup{
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "dockerfile" },
    root_dir = util.root_pattern("Dockerfile"),
    single_file_support = true,
    capabilities = capabilities,
}

lspconfig.jsonls.setup{
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    init_options = { provideFormatter = true },
    root_dir = util.find_git_ancestor,
    single_file_support = true,
    capabilities = capabilities,
}

lspconfig.sqlls.setup{
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    filetypes = { "sql", "mysql" },
    capabilities = capabilities,
}

lspconfig.vimls.setup{
    cmd = { "vim-language-server", "--stdio" },
    filetypes = { "vim" },
    init_options = {
        diagnostics = { enable = true },
        indexes = {
            count = 3,
            gap = 100,
            projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
            runtimepath = true
        },
        isNeovim = true,
        iskeyword = "@,48-57,_,192-255,-#",
        runtimepath = "",
        suggest = {
            fromRuntimepath = true,
            fromVimruntime = true,
        },
        vimruntime = "",
    },
    capabilities = capabilities,
}

lspconfig.yamlls.setup{
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.docker-compose" },
    root_dir = util.find_git_ancestor,
    settings = {
        redhat = {
            telemetry = { enabled = false }
        }
    },
    single_file_support = true,
    capabilities = capabilities,
}

require'nvim-treesitter.configs'.setup{
    indent = {
        enable = true
    },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    },
    refactor = {
        highlight_current_scope = { enable = true },
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-+>",
                goto_prev_usage = "<a-¿>"
            },
        },
    },
}

local telescope = require'telescope'
telescope.load_extension('ui-select')
telescope.load_extension('file_browser')
EOF

