local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

-- enable keybinds for available LSP server
local on_attach = function(client, bufnr)
  local keymap = vim.keymap
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set("n", "<leader>k", '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  keymap.set("n", "<leader>l", '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

  keymap.set("n", "<leader>j", '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  keymap.set("n", "<leader>D", '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)

  keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)

  -- typescript-specific keymaps
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>")
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")
  end
end

-- enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

typescript.setup({
  server = capabilities,
  on_attach = on_attach,
})

lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

lspconfig.astro.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
