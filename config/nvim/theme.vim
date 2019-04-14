function! VimrcLoadTheme()
  """""""""""
  if has('nvim') || has('termguicolors')
    set termguicolors
  endif

  function! MyHighlights() abort
    highlight Normal ctermbg=NONE guibg=NONE
    highlight LineNr ctermfg=NONE guibg=NONE
    highlight CursorLineNr ctermfg=NONE guibg=NONE
  endfunction

  augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
  augroup END

  colorscheme challenger_deep
  let g:lightline = { 'colorscheme': 'challenger_deep'}
  let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
  let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let s:palette.inactive.middle = s:palette.normal.middle
  let s:palette.tabline.middle = s:palette.normal.middle
  syntax on
  set noshowmode
endfunction

