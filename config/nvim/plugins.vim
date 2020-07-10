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

  " Fzf for fuzzy finding
  Plug 'junegunn/fzf', { 'do': 'yes \| ./install --all' }
  Plug 'junegunn/fzf.vim'

  " Wrapper of some neovim's :terminal functions
  Plug 'kassio/neoterm'

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
  Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

  " handlebars
  Plug 'mustache/vim-mustache-handlebars'

  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'


  " Asynchronous Lint Engine
  Plug 'w0rp/ale', { 'for':  ['javascript.jsx', 'javascript', 'jsx', 'ruby', 'typescript.tsx', 'typescript'] }
  let g:ale_fixers = {
        \ 'ruby': ['rubocop'],
        \ 'javascript': ['eslint']
        \ }
  let g:ale_fix_on_save = 1
  let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'ruby': ['rubocop']
        \}
  let g:ale_rust_cargo_use_check = 1

  " Testing
  Plug 'janko-m/vim-test'

  " Appearance
  " ------------
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'itchyny/lightline.vim'

  call plug#end()
endfunction

