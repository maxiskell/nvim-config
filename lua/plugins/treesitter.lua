require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'astro',
    'css',
    'go',
    'html',
    'javascript',
    'lua',
    'query',
    'rust',
    'typescript',
    'vim',
    'vimdoc',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
