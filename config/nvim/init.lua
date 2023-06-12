vim.g.ruby_operators = 1
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.copyindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ' '
vim.g.ackprg = 'rg --vimgrep --no-heading'

-- Trigger git coauthor input with :Gca
vim.api.nvim_create_user_command('Gca',
  function(opts)
    vim.cmd([[r!git log -n500 --pretty=format:"\%an <\%ae>" | grep -i ']] ..
      opts.fargs[1] .. [['| head -1 | xargs echo "Co-authored-by:"]])
  end,
  { nargs = 1 }
)

---- Shortcut to yank current file path
vim.keymap.set('n', '<leader>cf', ':let @+ = expand("%")<cr>')
----
---- Use <space><space> to toggle to the last buffer
vim.keymap.set('n', '<Leader><Leader>', '<c-^>')
---- Convenient re-source of vim config
vim.keymap.set('n', '<Leader>ve', ':edit ~/.config/nvim/init.lua<cr>')

vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]])

-- Install lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd([[
  source ~/.config/nvim/plugins/nerdtree.vim
  source ~/.config/nvim/plugins/test.vim
  source ~/.config/nvim/plugins/treesitter.vim
]])
-- source ~/.config/nvim/plugins/lspconfig.vim
-- source ~/.config/nvim/plugins/nvim_cmp.vim


-- vim.cmd([[
-- let g:lightline = {
--       \ 'colorscheme': 'wombat',
--       \ }
-- ]])

-- vim.cmd([[
-- set cursorline
-- hi cursorline cterm=none term=none
-- autocmd WinEnter * setlocal cursorline
-- autocmd WinLeave * setlocal nocursorline
-- highlight CursorLine guibg=#303000 ctermbg=234
-- ]])


