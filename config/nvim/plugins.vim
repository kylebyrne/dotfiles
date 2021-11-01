" Plugins {{{
let g:plug_window = 'botright new'

function! VimrcLoadPlugins()
  " Install vim-plug if not available {{{
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  " }}}

  call plug#begin()

  " General NeoVIM improvements
  " ------------------------
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  "Ack for acking
  Plug 'mileszs/ack.vim'

  "Nerdtree for interacting with file system
  Plug 'scrooloose/nerdtree'

  "Add commenting support which should be included already
  Plug 'tpope/vim-commentary'

  "Automatically add end to some languages
  Plug 'tpope/vim-endwise'

  "Manage surroundings like quotes, brackets etc
  Plug 'tpope/vim-surround'

  "git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'rhysd/git-messenger.vim'

  " tmux vim movement helpers
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'benmills/vimux'

  " Language and development
  " -------------------------
  " Easy navigation of the Rails directory structure, interface to
  " rake + rails, much much more: https://github.com/tpope/vim-rails
  " Plug 'tpope/vim-rails', { 'for': 'ruby' }
  " Plug 'tpope/vim-haml', { 'for': 'haml' }
  " Plug 'noprompt/vim-yardoc'

  " Javascript
  " Plug 'pangloss/vim-javascript'
  " Plug 'mxw/vim-jsx'

  " Asynchronous Lint Engine
  " Plug 'w0rp/ale', { 'for':  ['javascript.jsx', 'javascript', 'jsx', 'ruby'] }
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'

  Plug 'hrsh7th/nvim-cmp'
  " Install the buffer completion source
  Plug 'hrsh7th/cmp-buffer'
  
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-treesitter/playground'

  " Testing
  Plug 'janko-m/vim-test'

  " Appearance
  " ------------
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'itchyny/lightline.vim'
  Plug 'machakann/vim-highlightedyank'

  call plug#end()
endfunction

