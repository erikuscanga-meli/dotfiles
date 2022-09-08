" ========== General settings ==========

syntax enable

set noerrorbells
set scrolloff=5
set number
set history=1000
set showmatch
set matchtime=1
set nowrap
set encoding=UTF-8

" ========== Search settings ==========

set nohlsearch
set noincsearch
set smartcase

" ========== Optional settings ==========

set number
set relativenumber
set cursorline
set mouse=h

syntax sync minlines=200
set clipboard+=unnamed
set clipboard+=unnamedplus
set noshowmode
set splitbelow
set splitright
set wildmenu
set wildmode=longest,list,full
set completeopt=menu,menuone,noselect

set secure
set updatetime=300
set inccommand=nosplit
set omnifunc=syntaxcomplete#complete
set suffixesadd=.java,.go

" ========== Appearance ==========

set guicursor=
set colorcolumn=130
set textwidth=130
set background=dark
set laststatus=2
set termguicolors
set signcolumn=number
set lazyredraw

" ========== Indentation ==========

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab
set autoindent

" ============ Tab & space ============

set list
set listchars=tab:>·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:·
set listchars+=space:·
set fillchars+=vert:\│

" ========== Persistent undo ==========

set nobackup
set nowritebackup

if has("persistent_undo")
  let target_path = expand("~/.config/nvim/undodir")
  " create the directory and any parent directory
  " if the location does not exist.
  if !isdirectory(target_path)
    call mkdir(target_path, "p", 0700)
  endif

  let &undodir = target_path
  set undofile
endif

filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-project.nvim'

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'jdhao/better-escape.vim'
Plug 'mbbill/undotree'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'wellle/targets.vim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/nvim', {'as':'catppuccin'}

Plug 'windwp/nvim-autopairs'
Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }
Plug 'APZelos/blamer.nvim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
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

Plug 'kdheepak/lazygit.nvim'

call plug#end()

let mapleader = ' '

let g:catppuccin_flavour = "mocha" " variants: latte, frappe, macchiato, mocha
colorscheme catppuccin

if !has('gui_running')
  set t_Co=256
endif

let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0
let g:better_escape_shortcut = 'jj'
let g:better_escape_interval = 200

let g:blamer_enabled = 1
let g:blamer_delay = 500

" Buffer keybindings
nnoremap <leader>w <cmd>w<CR>
nnoremap <leader>q <cmd>q!<CR>
nnoremap <silent><leader>h <cmd>wincmd h<CR>
nnoremap <silent><leader>j <cmd>wincmd j<CR>
nnoremap <silent><leader>k <cmd>wincmd k<CR>
nnoremap <silent><leader>l <cmd>wincmd l<CR>
nnoremap <silent><leader>q <cmd>wincmd q<CR>
nnoremap <silent><leader>t :20sp<bar>:terminal<CR>
nnoremap <silent><leader>s :vs<bar>:terminal<CR>
nnoremap <silent><leader>+ <cmd>vertical resize +5<CR>
nnoremap <silent><leader>- <cmd>vertical resize -5<CR>

" Telescope keybinding
nnoremap <silent><leader>ff <cmd>Telescope find_files<CR>
nnoremap <silent><leader>fo <cmd>Telescope oldfiles<CR>
nnoremap <silent><leader>fg <cmd>Telescope live_grep<CR>
nnoremap <silent><leader>fb <cmd>Telescope buffers<CR>
nnoremap <silent><leader>fh <cmd>Telescope help_tags<CR>
nnoremap <silent><leader>fr <cmd>Telescope registers<CR>
nnoremap <silent><leader>fm <cmd>Telescope marks<CR>
nnoremap <silent><leader>fs <cmd>Telescope grep_string<CR>
nnoremap <silent><leader>fc <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent><leader>qf <cmd>Telescope quickfix<CR>
nnoremap <silent><leader>qh <cmd>Telescope quickfixhistory<CR>
nnoremap <silent><leader>sg <cmd>Telescope spell_suggest<CR>
nnoremap <silent><leader>hl <cmd>Telescope highlights<CR>

" Telescope add-ons
nnoremap <silent><leader>tb <cmd>Telescope file_browser<CR>
nnoremap <silent><leader>tw <cmd>lua require'telescope'.extensions.project.project{}<CR>

" Telescope LSP keybindings
nnoremap <silent><leader>lr <cmd>Telescope lsp_references<CR>
nnoremap <silent><leader>ls <cmd>Telescope lsp_document_symbols<CR>
nnoremap <silent><leader>lw <cmd>Telescope lsp_workspace_symbols<CR>
nnoremap <silent><leader>li <cmd>Telescope lsp_implementations<CR>
nnoremap <silent><leader>ld <cmd>Telescope lsp_definitions<CR>
nnoremap <silent><leader>lt <cmd>Telescope lsp_type_definitions<CR>
nnoremap <silent><leader>ld <cmd>Telescope diagnostics bufnr=0<CR>
nnoremap <silent><leader>wd <cmd>Telescope diagnostics<CR>
nnoremap <silent><leader>ts <cmd>Telescope treesitter<CR>
nnoremap <silent><leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>

vnoremap <silent><leader>df <cmd>lua vim.lsp.buf.formatting()<CR>

" Telescope git keybindings
nnoremap <silent><leader>gm <cmd>Telescope git_commits<CR>
nnoremap <silent><leader>gd <cmd>Telescope git_bcommits<CR>
nnoremap <silent><leader>gb <cmd>Telescope git_branches<CR>
nnoremap <silent><leader>gs <cmd>Telescope git_status<CR>
nnoremap <silent><leader>gt <cmd>Telescope git_stash<CR>
nnoremap <silent><leader>gf <cmd>Telescope git_stash<CR>

" Undotree keybindings
nnoremap <silent><leader>u <cmd>UndotreeToggle<CR>

" Go language-specific keybindings
nnoremap <silent><leader>tt <cmd>GoTest<CR>

" Buffer keybindings
nnoremap <silent><leader>bd <cmd>bd<CR>
nnoremap <silent><leader>bp <cmd>bp<CR>
nnoremap <silent><leader>bn <cmd>bn<CR>

" Other keybindings
nnoremap <silent><leader>n <cmd>nohl<CR>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

nnoremap <silent><leader>lg <cmd>LazyGit<CR>

" Moves selected text up/down
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

tnoremap <Esc> <C-\><C-n>

" Go language settings
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = 'goimports'
let g:go_auto_type_info = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

lua <<EOF
local catppuccin = require('catppuccin')
catppuccin.setup{
  transparent_background = false,
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true
    },
    cmp = true,
    telescope = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true
    }
  }
}
catppuccin.load()

require'nvim-treesitter.configs'.setup{
  ensure_installed = { 
    'bash', 
    'c_sharp',
    'css',
    'dockerfile', 
    'go',
    'gomod',
    'gowork',
    'html',
    'http',
    'java', 
    'json', 
    'jsonc', 
    'lua',
    'make', 
    'markdown',
    'python',
    'regex',
    'toml',
    'vim',
    'yaml'
  },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
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
        smart_rename = 'grr',
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gnd',
        list_definitions = 'gnD',
        list_definitions_toc = 'gO',
        goto_next_usage = '<a-+>',
        goto_prev_usage = '<a-¿>'
      },
    },
  },
}

require'lualine'.setup{
  options = {
    theme = 'catppuccin'
  },
}

require'nvim-autopairs'.setup()

require('indent_blankline').setup{
  show_current_context = true,
  show_current_context_start = true,
}

require'nvim-lsp-installer'.setup{
    ui = {
        border = 'single',
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
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = 'buffer' }
  })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'buffer' }
  }, {
    { name = 'cmdline' }
  })
})

require'renamer'.setup()

local lspconfig = require'lspconfig'
local util = require'lspconfig/util'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require'cmp_nvim_lsp'.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.bashls.setup{
  cmd = { 'bash-language-server', 'start' },
  cmd_env = { GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"},
  filetypes = { 'sh' },
  root_dir = util.find_git_ancestor,
  single_file_support = true,
  capabilities = capabilities,
}

lspconfig.dockerls.setup{
  cmd = { 'docker-langserver', '--stdio' },
  filetypes = { 'Dockerfile', 'Dockerfile.runtime' },
  root_dir = util.root_pattern('Dockerfile', 'Dockerfile.runtime'),
  single_file_support = true,
  capabilities = capabilities,
}

lspconfig.java_language_server.setup{
  filetypes = { 'java' },
}

lspconfig.jsonls.setup{
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc '},
  init_options = { provideFormatter = true },
  root_dir = util.find_git_ancestor,
  single_file_support = true,
  capabilities = capabilities,
}

lspconfig.sqlls.setup{
  cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
  filetypes = { 'sql', 'mysql' },
  capabilities = capabilities,
}

lspconfig.tsserver.setup{
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
  init_options = { hostInfo = 'neovim' },
  root_dir = util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
}

lspconfig.vimls.setup{
    cmd = { 'vim-language-server', '--stdio' },
    filetypes = { 'vim' },
    init_options = {
        diagnostics = { enable = true },
        indexes = {
            count = 3,
            gap = 100,
            projectRootPatterns = { 'runtime', 'nvim', '.git', 'autoload', 'plugin' },
            runtimepath = true
        },
        isNeovim = true,
        iskeyword = '@,48-57,_,192-255,-#',
        runtimepath = '',
        suggest = {
            fromRuntimepath = true,
            fromVimruntime = true,
        },
        vimruntime = '',
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

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('i', '<c-space>', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)
  buf_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<CR>', opts)
  buf_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', opts)
  end
end

lspconfig.gopls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'gomod' },
  settings = {
    gopls = {
      analyses = {
        fieldalignment = true,
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusedwrites = true,
      },
      staticcheck = true,

    },
  },
}

local telescope = require'telescope'
telescope.load_extension('ui-select')
telescope.load_extension('file_browser')
telescope.load_extension('project')
telescope.setup{
  extensions = {
    project = {
      base_dirs = {
        '~/go/src/github.com/mercadolibre',
        '~/java'
      },
      hidden_files = true,
    }
  }
}
EOF

augroup formatting
  au!
  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END
