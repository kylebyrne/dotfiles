
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

" Escape cleans the search highlight
nnoremap <ESC> :nohlsearch<cr>

" Shortcut to yank current file path
nnoremap <leader>cf :let @+ = expand("%")<CR>
au BufRead,BufNewFile *.md setlocal textwidth=80

" Move your lines about
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Use <space><space> to toggle to the last buffer
nnoremap <leader><leader> <c-^>

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

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

"""""""
" LSP "
"""""""
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  echom "loaded"
  " Find definition of word under cursor
  nnoremap <buffer> <leader>ld :LspDefinition<CR>
  " Find callers of word under cursor
  nnoremap <buffer> <leader>lr :LspReferences<CR>
  " Rename symbol throughout project
  nnoremap <buffer> <leader>lR :LspRename<CR>
  " Show docs (e.g. from libraries)
  nnoremap <buffer> <leader>lK :LspHover<CR>
  " Format document layout
  nnoremap <buffer> <leader>lf :LspDocumentFormat<CR>
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Address (likely temporary bug) whereby LSP completions with asyncomplete
" Ate two characters following insertion
let g:lsp_text_edit_enabled = 0
" Ruby lsp
" Prerequisites:
" > gem install solargraph
au User lsp_setup call lsp#register_server({
      \ 'name': 'solargraph',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bundle exec solargraph stdio']},
      \ 'initialization_options': {"diagnostics": "true"},
      \ 'whitelist': ['ruby'],
      \ })

" JavaScript and Typescript LSP
" Prerequisites:
" $ npm install -g typescript typescript-language-server
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
      \ })
endif


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
" let g:fzf_prefer_tmux = 1
let g:fzf_layout = { 'tmux': '-p50%,40%' }
"""""""
" Ack "
"""""""
nnoremap <Leader>f :Ack ''<left>
" make ack.vim use the thesilversearcher
let g:ackprg = 'rg --vimgrep --no-heading'


""""""""""""
" Nerdtree "
""""""""""""
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
let NERDTreeShowHidden = 1


"""""""""""
" Neomake "
"""""""""""
" Gross hack to stop Neomake running when exitting because it creates a zombie cargo check process
" which holds the lock and never exits. But then, if you only have QuitPre, closing one pane will
" disable neomake, so BufEnter reenables when you enter another buffer.
autocmd BufNewFile *.rs Neomake rustc
let s:quitting = 0
au QuitPre *.rs let s:quitting = 1
au BufEnter *.rs let s:quitting = 0
au BufWritePost *.rs if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
au QuitPre *.ts let s:quitting = 1
au BufEnter *.ts let s:quitting = 0
au BufWritePost *.ts if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
let g:neomake_warning_sign = {'text': '?'}
let g:neomake_error_sign={'texthl': 'NeomakeErrorMsg'}


"""""""""""""""""""""""
" vim-highlightedyank "
"""""""""""""""""""""""
let g:highlightedyank_highlight_duration = 500
