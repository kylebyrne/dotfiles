
" Load plugins
" ----------------------------------------------------------------------

" Load plugin file …
exec 'source ~/.config/nvim/plugins.vim'
" … and execute
call VimrcLoadPlugins()

set nocompatible

"""""""""""
" THEMING "
"""""""""""
exec 'source ~/.config/nvim/theme.vim'
" … and execute
call VimrcLoadTheme()

"
""""""""""""""""""""""""
" GENERAL VIM SETTINGS "
""""""""""""""""""""""""

let mapleader = " "                   " change leader to space
let maplocalleader = " "

set noswapfile                        "Fuck swp files

map <leader>s :source ~/.vimrc<CR>

set clipboard+=unnamedplus            " use the system clipboard

set splitright                        "Handle splitting and navigating splits
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set number                            " show line numbers
set hidden                            " Keep unsaved files open in buffers w/o the need to write

filetype indent on                    "formatting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set copyindent
set smartindent
set nowrap

set number relativenumber             " turn hybrid line numbers on

set scrolloff=3                       " keep more context when scrolling off the end of a buffer

"searching
set ignorecase
set smartcase
" Escape cleans the search highlight
:nnoremap <ESC> :nohlsearch<cr>

nnoremap <leader>cf :let @+ = expand("%")<CR>

"
"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'ruby': ['solargraph', 'stdio'],
        \ }
autocmd CompleteDone * silent! pclose!
autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
set completeopt-=preview
let g:rustfmt_autosave = 1

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

" vim-test remap
map <Leader>r :TestFile<CR>
let test#strategy = "neovim"
let test#neovim#term_position = "belowright"

" ctrlp but like ctrl
nnoremap <Leader>t :CtrlP <CR>
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" make CtrlP use ag for listing files
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Ack
nnoremap <Leader>f :Ack ''<left>
" make ack.vim use the thesilversearcher
let g:ackprg="ag --nogroup --nocolor --column"

" Nerdtree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
let NERDTreeShowHidden = 1


" Neomake
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


" Markdown
nnoremap <Leader>m :MarkdownPreview<CR>
let g:mkdp_auto_close = 0
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format



"""""""""""""""""""""
" Terminal Settings "
"""""""""""""""""""""
tnoremap <ESC> <C-\><C-n>

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor

