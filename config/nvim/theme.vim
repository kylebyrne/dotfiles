function! VimrcLoadTheme()
  """""""""""
  if has('nvim') || has('termguicolors')
    set termguicolors
  endif

  colorscheme kbyrne
  let g:ruby_operators = 1
  syntax on
  set noshowmode
endfunction

