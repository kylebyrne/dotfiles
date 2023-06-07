return {
  {
    "mileszs/ack.vim",
    lazy=false,
    keys = {
      { "<leader>f", ":Ack ''<left>"},
    },
  },
  "tpope/vim-commentary",
  "tpope/vim-endwise",
  "tpope/vim-fugitive",
  "jessarcher/vim-heritage",
  "itchyny/lightline.vim",
  "scrooloose/nerdtree",
  -- lsp
  'neovim/nvim-lspconfig',
  'mihyaeru21/nvim-lspconfig-bundler',
  -- nvim_cmp
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'saadparwaiz1/cmp_luasnip',
  'onsails/lspkind.nvim',

  --lspsaga
  {'glepnir/lspsaga.nvim', branch= 'main' },

  --luasnip
  'L3MON4D3/LuaSnip',

  --rhubarb
  'tpope/vim-rhubarb',

  --surround
  'tpope/vim-surround',

  --test
  'janko-m/vim-test',

  --tmux_navigator
  'christoomey/vim-tmux-navigator',

  --treesitter
  {'nvim-treesitter/nvim-treesitter', build = ":TSUpdate", },
  'nvim-treesitter/playground',

  --vimux
  'benmills/vimux'
}
