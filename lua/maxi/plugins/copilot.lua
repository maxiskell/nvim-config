-- Avoid 'Copilot: <Tab> map has been disabled or is claimed by another plugin'
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = false,
  ["rust"] = true,
}

-- vim.cmd [[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
