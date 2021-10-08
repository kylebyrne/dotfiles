function! VimrcLoadTheme()
  """""""""""
  if has('nvim') || has('termguicolors')
    set termguicolors
  endif

  function! MyHighlights() abort
    "Tweaks currently live in colors/vwilight.vim
  endfunction

  augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
  augroup END


  colorscheme vwilight
  let g:ruby_operators = 1
  syntax on
  set noshowmode
endfunction

