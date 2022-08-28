-- This file can be loaded by calling `lua require('plugins')` from your init.vim

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use { 'glepnir/galaxyline.nvim' ,  branch = 'main' }
  -- colorschemes
  use 'lunarvim/horizon.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
end)

require('configs.telescope')
require('configs.allofem')
require('configs.galaxyline')


-- 
-- Plugins Not in but might be usefull
-- https://github.com/onsails/lspkind.nvim
