Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

nmap <leader>h :TSHighlightCapturesUnderCursor<CR>

function TreesitterSetup()
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "ruby",
    "javascript",
    "json",
    "yaml",
    "html",
    "scss"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.ruby.filetype_to_parsername = { "ruby" }
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF
endfunction

augroup TreesitterSetup
    autocmd!
    autocmd User PlugLoaded call TreesitterSetup()
augroup END
