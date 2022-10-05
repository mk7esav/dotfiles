
vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = {eol = '↵', space = ' ', tab = '> '}
vim.cmd [[packadd packer.nvim]]

vim.opt.shiftwidth = 4 -- number of spaces used when tab is pressed
vim.opt.expandtab = true -- spaces over tabs

vim.opt.cursorline = true
vim.opt.cursorcolumn = false

vim.opt.swapfile = false -- no swap file
vim.opt.wrap = false;

vim.g.mapleader = ' '

vim.cmd [[ vnoremap <S-Up> <Up> ]]
vim.cmd [[ vnoremap <S-Down> <Down>]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'morhetz/gruvbox'
  vim.cmd [[colo gruvbox]]
  vim.g.gruvbox_contrast_dark = 'hard'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "java", "lua", "json", "go", "bash", "markdown" },
    highlight = { 
        enable = true,
    },
  }

  -- Lualine
  use 'nvim-lualine/lualine.nvim'
  require ('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
    }
  }

  -- File operations
  use 'cloudhead/neovim-fuzzy'
  vim.g.fuzzy_rootcmds = [["git", "rev-parse", "--show-toplevel"]]
  vim.cmd [[ nnoremap <leader>f :FuzzyOpen<cr> ]]
  vim.cmd [[ nnoremap <leader>g :FuzzyGrep<cr> ]]

  -- Snippets
end)

