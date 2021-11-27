colorscheme kbyrne
let g:ruby_operators = 1
syntax on
set noshowmode

set noswapfile
set splitright
set splitbelow
set number relativenumber
set hidden
set termguicolors
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set copyindent
set smartindent
set nowrap
set scrolloff=8
set ignorecase
set smartcase

filetype indent on

" Commands
"--------------------------------------------------------------------------

" Trigger git coauthor input with :Gca
command! -nargs=+ Gca :r!git log -n100 --pretty=format:"\%an <\%ae>" | grep -i '<args>' | head -1 | xargs echo "Co-authored-by:"
"--------------------------------------------------------------------------

" Mappings
"--------------------------------------------------------------------------
let mapleader = "\<space>"

" Easier split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Shortcut to yank current file path
nnoremap <leader>cf :let @+ = expand("%")<CR>

" Use <space><space> to toggle to the last buffer
nnoremap <leader><leader> <c-^>

" Convenient re-source of vim config
"
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim <CR>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>
"--------------------------------------------------------------------------

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
