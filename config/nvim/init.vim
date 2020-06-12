
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

" Use the system clipboard
set clipboard+=unnamedplus

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
:nnoremap <ESC> :nohlsearch<cr>

" Shortcut to yank current file path
nnoremap <leader>cf :let @+ = expand("%")<CR>

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

""""""""""""
" vim-test "
""""""""""""
map <Leader>r :TestFile<CR>
let test#strategy = "neovim"
let test#neovim#term_position = "belowright"


"""""""
" fzf "
"""""""
nnoremap <Leader>t :FZF <CR>
let g:fzf_prefer_tmux = 1
let g:fzf_layout = { 'tmux': '-p50%,40%' }
"""""""
" Ack "
"""""""
nnoremap <Leader>f :Ack ''<left>
" make ack.vim use the thesilversearcher
let g:ackprg="ag --nogroup --nocolor --column"


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
