" Vim color file
" Converted from Textmate theme Twilight using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "kbyrne"

hi Cursor           guifg=NONE    guibg=#a7a7a7 gui=NONE
hi Visual           guifg=NONE    guibg=#3c4043 gui=NONE
hi CursorLine       guifg=NONE    guibg=#2b2b2b gui=NONE
hi CursorColumn     guifg=NONE    guibg=#2b2b2b gui=NONE
hi ColorColumn      guifg=NONE    guibg=#2b2b2b gui=NONE
hi LineNr           guifg=#868686 guibg=#2b2b2b gui=NONE
hi VertSplit        guifg=#565656 guibg=#565656 gui=NONE
hi MatchParen       guifg=#cda869 guibg=NONE    gui=NONE
hi StatusLine       guifg=#f8f8f8 guibg=#565656 gui=bold
hi StatusLineNC     guifg=#f8f8f8 guibg=#565656 gui=NONE
hi Pmenu            guifg=#9b703f guibg=NONE    gui=NONE
hi PmenuSel         guifg=NONE    guibg=#3c4043 gui=NONE
hi IncSearch           guifg=#ffffff guibg=#cf6a4c gui=NONE
hi Search           guifg=NONE    guibg=#343a44 gui=NONE
hi Directory        guifg=#cf6a4c guibg=NONE    gui=NONE
hi Folded           guifg=#5f5a60 guibg=#141414 gui=NONE

hi Normal           guifg=#f8f8f8 guibg=#141414 gui=NONE
hi Boolean          guifg=#c4a9e0 guibg=NONE    gui=NONE
hi Character        guifg=#cf6a4c guibg=NONE    gui=NONE
hi Comment          guifg=#5f5a60 guibg=NONE    gui=italic
hi Conditional      guifg=#e389a5 guibg=NONE    gui=NONE
hi Constant         guifg=#cf6a4c guibg=NONE    gui=NONE
hi Define           guifg=#7798b2 guibg=NONE    gui=NONE
hi ErrorMsg         guifg=NONE    guibg=NONE    gui=NONE
hi WarningMsg       guifg=NONE    guibg=NONE    gui=NONE
hi Float            guifg=#ffc491 guibg=NONE    gui=NONE
hi Function         guifg=#eda357 guibg=NONE    gui=NONE
hi Identifier       guifg=#fbfbc6 guibg=NONE    gui=NONE
hi Keyword          guifg=#e389a5 guibg=NONE    gui=NONE
hi Label            guifg=#8f9d6a guibg=NONE    gui=NONE
hi NonText          guifg=#4f4f4f guibg=#1f1f1f gui=NONE
hi Number           guifg=#7bc7ae guibg=NONE    gui=NONE
hi Operator         guifg=#cda869 guibg=NONE    gui=NONE
hi PreProc          guifg=#e8736b guibg=NONE    gui=NONE
hi Special          guifg=#f8f8f8 guibg=NONE    gui=NONE
hi SpecialKey       guifg=#4f4f4f guibg=#2b2b2b gui=NONE
hi Statement        guifg=#cda869 guibg=NONE    gui=NONE
hi StorageClass     guifg=#f9ee98 guibg=NONE    gui=NONE
hi String           guifg=#7bc7a6 guibg=NONE    gui=NONE
hi Tag              guifg=#9b703f guibg=NONE    gui=NONE
hi Title            guifg=#f8f8f8 guibg=NONE    gui=bold
hi Todo             guifg=#5f5a60 guibg=NONE    gui=inverse,bold,italic
hi Type             guifg=#de6d5c guibg=NONE    gui=NONE
hi Underlined       guifg=NONE    guibg=NONE    gui=underline

hi diffAdded        guifg=#7bc7ae
hi diffRemoved      guifg=#de6d5c

" Tweaks
hi SignColumn      guibg=#141414
hi GitGutterAdd    guifg=#8E9C6B guibg=#141414
hi GitGutterChange guifg=#CEA869 guibg=#141414
hi GitGutterDelete guifg=#CF694C guibg=#141414
hi PMenu           guifg=#141414 guibg=#cf6a4c
hi PMenuSel        guifg=#141414 guibg=#cda869
hi LineNr          ctermfg=59 ctermbg=233 guifg=#5f5a60 guibg=#141414
hi CursorLineNr    guifg=#f8f8f8
hi StatusLine      ctermfg=59 ctermbg=233 guifg=#5f5a60 guibg=#141414
hi StatusLineNC    ctermfg=59 ctermbg=233 guifg=#5f5a60 guibg=#141414
hi NonText         ctermfg=59 ctermbg=233 guifg=#5f5a60 guibg=#141414

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=234

if ! has('gui_running')
    hi String ctermfg=2
    hi rubyGlobalVariable ctermfg=4
    hi Identifier ctermfg=3
    hi Constant ctermfg=1
    hi Number ctermfg=1
    hi Boolean ctermfg=1
    hi link doxygenBrief phpComment
    hi SpecialComment ctermfg=237
    hi link phpMethodsVar phpIdentifier
    "hi link phpType phpFunctions
    hi link phpClasses Tag
    hi link phpAssignByRef phpFunctions

    hi Directory ctermfg=6
    hi NERDTreeDirSlash ctermfg=12
    hi NERDTreeFile ctermfg=2
    hi NERDTreeFlag ctermfg=1
    hi NERDTreeExecFile ctermfg=7
    hi link sqlKeyword sqlOperator

    hi phpFunctions ctermfg=7
    hi doxygenOther ctermfg=3
    hi doxygenSpecial ctermfg=3
    hi link doxygenSpecialMultilineDesc phpComment
    hi link doxygenSpecialOnelineDesc phpComment
    hi doxygenParam ctermfg=3
    hi doxygenParamName ctermfg=6 cterm=NONE
    hi doxygenBOther ctermfg=3
    hi Type ctermfg=13
    hi Tag ctermfg=5
    hi Statement ctermfg=3
    hi Operator ctermfg=3
    hi phpMemberSelector ctermfg=3
    hi Function ctermfg=7
    hi Identifier ctermfg=4
    hi link phpInclude phpStatement

    hi clear htmlSpecialChar
    hi link htmlSpecialChar Constant

    hi vimHiTerm ctermfg=7
endif

hi IndentGuidesEven ctermbg=234
hi IndentGuidesOdd  ctermbg=234

" Color Spelling Errors a little better
hi clear SpellBad
hi SpellBad cterm=underline ctermbg=NONE ctermfg=124
hi SpellCap ctermbg=235 ctermfg=NONE
hi SpellRare ctermbg=235 ctermfg=NONE

hi Search ctermbg=237


