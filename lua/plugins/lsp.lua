local lsp = require 'lsp-zero'

lsp.preset 'recommended'

lsp.ensure_installed({
  'gopls',
  'eslint',
  'lua_ls',
  'tsserver',
})

local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<c-k>'] = cmp.mapping.select_prev_item(),
  ['<c-j>'] = cmp.mapping.select_next_item(),
  ['<c-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1)),
  ['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1)),
  ['<c-e>'] = cmp.mapping.abort(),
  ['<cr>'] = cmp.mapping.confirm({ select = false }),
})

lsp.set_preferences({
  sign_icons = {},
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  select = cmp_select,
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local k = vim.keymap

  k.set('n', '<leader>k', function()
    vim.lsp.buf.hover()
  end, opts)
  k.set('n', '<leader>sh', function()
    vim.lsp.buf.signature_help()
  end, opts)
  k.set('n', '<leader>vws', function()
    vim.lsp.buf.workspace_symbol()
  end, opts)

  k.set('n', '<leader>j', function()
    vim.diagnostic.open_float()
  end, opts)
  k.set('n', '<leader>D', function()
    vim.diagnostic.setloclist()
  end, opts)
  k.set('n', ']d', function()
    vim.diagnostic.goto_next()
  end, opts)
  k.set('n', '[d', function()
    vim.diagnostic.goto_prev()
  end, opts)
end)

lsp.setup()

require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})
