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
  " Autocompletion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }

  Plug 'prabirshrestha/vim-lsp'

  " Fzf for fuzzy finding
  Plug 'junegunn/fzf', { 'do': 'yes \| ./install --all' }
  Plug 'junegunn/fzf.vim'

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
  Plug 'tpope/vim-fugitive'

  " tmux vim movement helpers
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'benmills/vimux'

  " Language and development
  " -------------------------
  " Easy navigation of the Rails directory structure, interface to
  " rake + rails, much much more: https://github.com/tpope/vim-rails
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-haml', { 'for': 'haml' }
  Plug 'noprompt/vim-yardoc'

  Plug 'LnL7/vim-nix'

  " rust
  Plug 'rust-lang/rust.vim'
  Plug 'pest-parser/pest.vim'
  Plug 'neomake/neomake', { 'for': ['rust'] }

  " Javascript
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  " handlebars
  Plug 'mustache/vim-mustache-handlebars'

  " Asynchronous Lint Engine
  Plug 'w0rp/ale', { 'for':  ['javascript.jsx', 'javascript', 'jsx', 'ruby'] }

  " Testing
  Plug 'janko-m/vim-test'

  " Appearance
  " ------------
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'itchyny/lightline.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'jaywilliams/vim-vwilight'

  call plug#end()
endfunction

