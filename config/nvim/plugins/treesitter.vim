Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

nmap <leader>h :TSHighlightCapturesUnderCursor<CR>

function TreesitterSetup()
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
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
parser_config.ruby.used_by = { "ruby" }
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF
endfunction

augroup TreesitterSetup
    autocmd!
    autocmd User PlugLoaded call TreesitterSetup()
augroup END
