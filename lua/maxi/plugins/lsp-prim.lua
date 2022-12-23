local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then
  return
end

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

lsp.preset('recommended')

lsp.ensure_installed({
  "tsserver",
  "html",
  "cssls",
  "tailwindcss",
  "sumneko_lua",
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<c-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
  sign_icons = { }
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local keymap = vim.keymap

  keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end, opts)
  keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  keymap.set("i", "<C-h>rn", function() vim.lsp.buf.signature_help() end, opts)
end
)

lsp.setup()
