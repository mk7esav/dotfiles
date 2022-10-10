
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
vim.opt.cmdheight = 1

vim.g.mapleader = ' '

vim.cmd [[ vnoremap <S-Up> <Up> ]]
vim.cmd [[ vnoremap <S-Down> <Down>]]
vim.cmd [[ vnoremap > >gv ]]
vim.cmd [[ vnoremap < <gv ]]
vim.cmd [[ nnoremap <leader>q :q!<cr> ]]
vim.cmd [[ nnoremap <leader>w :w!<cr> ]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'altercation/vim-colors-solarized'
  vim.g.solarized_termcolors = 16
  vim.g.solarized_termtrans = 0
  vim.g.solarized_degrade = 0
  vim.g.solarized_bold = 1
  vim.g.solarized_underline = 1
  vim.g.solarized_italic = 0
  vim.g.solarized_contrast = "normal"
  vim.g.solarized_visibility = "low"
  vim.g.solarized_hitrail = 1
  vim.g.solarized_menu = 1
  vim.cmd [[colorscheme solarized]]


  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "java", "lua", "json", "go", "bash", "markdown" },
    highlight = { 
        enable = true,
    },
  }

  -- Lualine
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  require ('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'solarized',
    }, 
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'buffers' },
        lualine_d = { 'diagnostics' },
        lualine_e = {}
    }
  }

  -- Fancy Console
  use 'voldikss/vim-floaterm'
    
  -- Fuzzy Finder
  use { 'junegunn/fzf' }
  vim.cmd [[ nnoremap <leader>f :FZF<cr> ]]


  -- LSP and Autocompletions
  use 'neovim/nvim-lspconfig'
  use { 'ms-jpq/coq_nvim', branch = 'coq' }
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  use { 'ms-jpq/coq.thirdparty', branch = '3p' }
  
  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

  local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end

  local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }

  local lsp = require('lspconfig')
  local coq = require('coq')

  lsp['pyright'].setup {
     coq.lsp_ensure_capabilities({
          on_attach = on_attach,
          flags = lsp_flags,
      })
 }

  -- Java
  use 'mfussenegger/nvim-jdtls'
end)

