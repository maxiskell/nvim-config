require('formatter').setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    go = {
      require('formatter.filetypes.go').gofmt,
      require('formatter.filetypes.go').goimports,
    },
    html = {
      require('formatter.filetypes.html').prettierd,
    },
    lua = {
      require('formatter.filetypes.lua').stylua,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettierd,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettierd,
    },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettierd,
    },
    ['*'] = {
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
})

-- Format on save
vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]]
