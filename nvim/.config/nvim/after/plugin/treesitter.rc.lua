require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
      "c", "lua", "rust", 
      "html", "css", "json",
      "tsx", "javascript", "lua"
  },

  autotag = {
      enable = true,
  },

  indent = {
      enable = true,
      disable = {},
  },

  sync_install = false,

  auto_install = true,

  ignore_install = { "javascript" },

  highlight = {
    enable = true,
    disable = {},
  },
}
