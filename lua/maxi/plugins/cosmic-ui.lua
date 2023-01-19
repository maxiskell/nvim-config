local status, cosmic_ui = pcall(require, "cosmic-ui")
if not status then
  return
end

cosmic_ui.setup({
  -- default border to use
  -- 'single', 'double', 'rounded', 'solid', 'shadow'
  border_style = 'rounded',
  rename = {
    border = {
      highlight = 'FloatBorder',
      style = 'single',
      title = ' Rename ',
      title_align = 'left',
      title_hl = 'FloatBorder',
    },
    prompt = '> ',
    prompt_hl = 'Comment',
  },
  code_actions = {
    min_width = nil,
    border = {
      bottom_hl = 'FloatBorder',
      highlight = 'FloatBorder',
      style = 'single',
      title = 'Code Actions',
      title_align = 'center',
      title_hl = 'FloatBorder',
    },
  }
})

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>rn", "<cmd>lua require('cosmic-ui').rename()<cr>")
map("n", "<leader>ca", "<cmd>lua require('cosmic-ui').code_actions()<cr>")
map("v", "<leader>ca", "<cmd>lua require('cosmic-ui').range_code_actions()<cr>")
