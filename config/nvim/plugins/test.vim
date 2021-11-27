Plug 'janko-m/vim-test'

map <Leader>r :TestFile<CR>
map <Leader>e :TestNearest<CR>
map <Leader>w :TestLast<CR>
let test#strategy = "vimux"
let test#neovim#term_position = "belowright"
