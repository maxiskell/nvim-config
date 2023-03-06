local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    code_actions.gitsigns,
    formatting.prettierd,
    formatting.rustfmt,
    formatting.stylua.with({ extra_args = { "--indent_type", "Spaces" } }),
  },
  on_attach = function(client, bufnr)
    local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
