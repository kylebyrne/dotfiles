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
  " Enhanced terminal integration
  Plug 'wincent/terminus'
  " Autocompletion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'uplus/deoplete-solargraph'
	Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }

  " Wrapper of some neovim's :terminal functions
  Plug 'kassio/neoterm'
  " Plugin to help you stop repeating the basic movement keys
  Plug 'takac/vim-hardtime'

  "Ctrl P for fuzzy finding
  Plug 'kien/ctrlp.vim'

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

  " Language and development
  " -------------------------
  " Easy navigation of the Rails directory structure, interface to
  " rake + rails, much much more: https://github.com/tpope/vim-rails
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-haml', { 'for': 'haml' }

  Plug 'rust-lang/rust.vim'

  " Vim support for editing fish scripts
  Plug 'dag/vim-fish', { 'for': 'fish' }

  " Asynchronous Lint Engine
  Plug 'w0rp/ale', { 'for':  ['javascript.jsx', 'javascript', 'jsx', 'ruby', 'typescript.tsx', 'typescript'] }
  let g:ale_linters = {
        \   'javascript': ['standard'],
        \}
  let g:ale_fixers = {'javascript': ['standard']}
  let g:ale_lint_on_save = 1
  let g:ale_rust_cargo_use_check = 1
  " let g:ale_fix_on_save = 1

  " Javascript Support
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  Plug 'ludovicchabant/vim-gutentags'
  Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

  " Testing
  Plug 'janko-m/vim-test'

  " Appearance
  " ------------
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'itchyny/lightline.vim'

  call plug#end()
endfunction

