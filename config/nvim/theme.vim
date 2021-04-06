function! VimrcLoadTheme()
  """""""""""
  if has('nvim') || has('termguicolors')
    set termguicolors
  endif

  function! MyHighlights() abort
    highlight SignColumn      guibg=#141414
    highlight GitGutterAdd    guifg=#8E9C6B guibg=#141414
    highlight GitGutterChange guifg=#CEA869 guibg=#141414
    highlight GitGutterDelete guifg=#CF694C guibg=#141414
    highlight PMenu guifg=#141414 guibg=#cf6a4c
    highlight PMenuSel guifg=#141414 guibg=#cda869
    highlight LineNr ctermfg=59 ctermbg=233 guifg=#5f5a60 guibg=#141414
    highlight CursorLineNr guifg=#f8f8f8
    highlight StatusLine ctermfg=59 ctermbg=233 guifg=#5f5a60 guibg=#141414
    highlight StatusLineNC ctermfg=59 ctermbg=233 guifg=#5f5a60 guibg=#141414
    highlight NonText ctermfg=59 ctermbg=233 guifg=#5f5a60 guibg=#141414
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

