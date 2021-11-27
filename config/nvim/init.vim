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


" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  source ~/.config/nvim/plugins/ack.vim
  source ~/.config/nvim/plugins/cmp.vim
  source ~/.config/nvim/plugins/commentary.vim
  source ~/.config/nvim/plugins/copilot.vim
  source ~/.config/nvim/plugins/endwise.vim
  source ~/.config/nvim/plugins/fugitive.vim
  source ~/.config/nvim/plugins/fzf.vim
  source ~/.config/nvim/plugins/git_messenger.vim
  source ~/.config/nvim/plugins/highlighted_yank.vim
  source ~/.config/nvim/plugins/lightline.vim
  source ~/.config/nvim/plugins/lspconfig.vim
  source ~/.config/nvim/plugins/nerdtree.vim
  source ~/.config/nvim/plugins/rhubarb.vim
  source ~/.config/nvim/plugins/surround.vim
  source ~/.config/nvim/plugins/test.vim
  source ~/.config/nvim/plugins/tmux_navigator.vim
  source ~/.config/nvim/plugins/treesitter.vim
  source ~/.config/nvim/plugins/vimux.vim
call plug#end()

doautocmd User PlugLoaded

"--------------------------------------------------------------------------
