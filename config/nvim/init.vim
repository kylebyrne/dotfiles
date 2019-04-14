" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

" language support
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'dag/vim-fish'
Plug 'vim-ruby/vim-ruby'
Plug 'digitaltoad/vim-pug'

" prettyness
Plug 'zeis/vim-kolor'
Plug 'itchyny/lightline.vim'

" the rest
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

set nocompatible

"
""""""""""""""""""""""""
" GENERAL VIM SETTINGS "
""""""""""""""""""""""""

" change leader to space
let mapleader = " "
let maplocalleader = " "

" resource mapping
map <leader>s :source ~/.vimrc<CR>
" nmap <silent> t<C-f> :TestFile<CR>
map <Leader>r :TestFile<CR>
nnoremap <Leader>t :CtrlP <CR>
nnoremap <Leader>f :Ack ''<left>

" make ack.vim use the thesilversearcher
let g:ackprg="ag --nogroup --nocolor --column"

" use the system clipboard
"
set clipboard+=unnamedplus
"enable filetype detection
filetype on

set backspace=indent,eol,start

"Fuck swp files
set noswapfile
set number

" allow unsaved background buffers and remember marks/undo for them
set hidden

" remember more commands and search history
set history=10000

"Handle splitting and navigating splits
set splitright
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

filetype indent on

"formatting
set nowrap
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set autoindent
autocmd BufWritePre * :%s/\s\+$//e
set showmatch
set wildignore+=*.log,*.cache
let g:gitgutter_sign_column_always=1
set hlsearch

"""""""""""""""""""
" CTRL P Settings "
"""""""""""""""""""

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" make CtrlP use ag for listing files
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'


"""""""""""""""""""
" PRETTINESS "
"""""""""""""""""""

" Set color scheme
colorscheme kolor
syntax on
set noshowmode

"""""""""""""""""""""
" NERDtree Settings "
"""""""""""""""""""""

let NERDTreeMapActivateNode='<right>'
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
if !has('gui_running')
  set t_Co=256
endif
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\DS_Store$']
let g:NERDTreeNodeDelimiter = "\u00a0"

autocmd VimEnter * wincmd p

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

set foldmethod=syntax
set nofoldenable

