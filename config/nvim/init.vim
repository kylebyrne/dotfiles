
" Load plugins
" ----------------------------------------------------------------------

" Load plugin file …
exec 'source ~/.config/nvim/plugins.vim'
" … and execute
call VimrcLoadPlugins()

set nocompatible

" ============================================
" ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
" ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
"    ██║   ███████║█████╗  ██╔████╔██║█████╗  
"    ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
"    ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
"    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
" ============================================
"
exec 'source ~/.config/nvim/theme.vim'
" … and execute
call VimrcLoadTheme()

" =============================
" ███╗   ███╗██╗███████╗ ██████╗
" ████╗ ████║██║██╔════╝██╔════╝
" ██╔████╔██║██║███████╗██║     
" ██║╚██╔╝██║██║╚════██║██║     
" ██║ ╚═╝ ██║██║███████║╚██████╗
" ╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝
" =============================

" change leader to space
let mapleader = " "
let maplocalleader = " "

" Avoid swp files at all costs
set noswapfile

set mouse=a

" Convenient re-source of vim config
map <leader>s :source ~/.config/nvim/init.vim <CR>

" " Use the system clipboard
" set clipboard+=unnamedplus

" Change splitting rules
set splitright
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use relative line numbers
set number relativenumber

" Keep unsaved files open in buffers w/o the need to write
set hidden

"formatting
filetype indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set copyindent
set smartindent
set nowrap

" keep more context when scrolling off the end of a buffer
set scrolloff=3

"searching
set ignorecase
set smartcase

" Shortcut to yank current file path
nnoremap <leader>cf :let @+ = expand("%")<CR>
au BufRead,BufNewFile *.md setlocal textwidth=80

" Use <space><space> to toggle to the last buffer
nnoremap <leader><leader> <c-^>


" Trigger git coauthor input with :Gca
command! -nargs=+ Gca :r!git log -n100 --pretty=format:"\%an <\%ae>" | grep -i '<args>' | head -1 | xargs echo "Co-authored-by:"

" Open notes file in new tab
nmap <script>n<CR> <SID>:tab drop tmp/notes.md<CR>

" ======================================================
" ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
" ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
" ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
" ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
" ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
" ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
" ======================================================


""""""""""""
" Deoplete "
""""""""""""
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'ruby': ['solargraph', 'stdio'],
        \ }
autocmd CompleteDone * silent! pclose!
autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
set completeopt-=preview
let g:rustfmt_autosave = 1
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

"""""""
" ALE "
"""""""
let g:ale_completion_enabled = 0

let g:ale_fix_on_save = 1

let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['eslint']
      \ }
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'ruby': ['solargraph', 'ruby', 'rubocop']
      \}

let g:ale_ruby_rubocop_options = '--force-exclusions'

let g:ale_rust_cargo_use_check = 1

""""""""""""
" vim-test "
""""""""""""
map <Leader>r :TestFile<CR>
map <Leader>e :TestNearest<CR>
map <Leader>w :TestLast<CR>
let test#strategy = "vimux"
let test#neovim#term_position = "belowright"


"""""""
" fzf "
"""""""
nnoremap <Leader>t :Files <CR>
nnoremap <Leader>b :Buffers <CR>

"""""""
" Ack "
"""""""
nnoremap <Leader>f :Ack ''<left>
" make ack.vim use the thesilversearcher
let g:ackprg = 'rg --vimgrep --no-heading'

"""""""""""""
" Telescope "
"""""""""""""
" Find files using Telescope command-line sugar.
nnoremap <leader>t <cmd>Telescope git_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

""""""""""""
" Nerdtree "
""""""""""""
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
let NERDTreeShowHidden = 1


"""""""""""""""""""""""
" vim-highlightedyank "
"""""""""""""""""""""""
let g:highlightedyank_highlight_duration = 500

"""""""""""""""""
" git-messenger "
"""""""""""""""""
let g:git_messenger_include_diff = "current"
let g:git_messenger_always_into_popup = v:true
let g:git_messenger_max_popup_height = 35

""""""""""""""""""
" nvim lsp "
" """"""""""
set completeopt=menuone,noinsert,noselect
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  print('Attaching LSP: ' .. client.name)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
nvim_lsp.solargraph.setup {
  on_attach = on_attach,
  filetypes = {"ruby", "rakefile"},
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
      }
    }
  }
nvim_lsp.tsserver.setup{}

local saga = require 'lspsaga'
saga.init_lsp_saga { }

EOF

nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent>S <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> R <Cmd>Lspsaga rename<CR>
nnoremap <silent> N <Cmd>Lspsaga diagnostic_jump_next<CR>


"Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "ruby",
    "javascript",
    "json",
    "yaml",
    "html",
    "scss"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.ruby.used_by = { "ruby" }
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF


lua <<EOF
-- Set completeopt to have a better completion experience
vim.opt.completeopt = {"menuone", "longest", "preview"}

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'buffer' }
  },
}
EOF
nmap <leader>h :TSHighlightCapturesUnderCursor<CR>

" Copilot "
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
