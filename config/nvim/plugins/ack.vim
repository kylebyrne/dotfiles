Plug 'mileszs/ack.vim'

nnoremap <Leader>f :Ack ''<left>
" make ack.vim use the thesilversearcher
let g:ackprg = 'rg --vimgrep --no-heading'
