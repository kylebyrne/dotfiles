Plug 'shime/vim-livedown'
nmap gm :LivedownToggle<CR>

 " Wrap text in markdown
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END
