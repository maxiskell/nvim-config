local telescope = require 'telescope'
local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'

telescope.setup({
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    dynamic_preview_title = true,
    mappings = {
      n = {
        ['t'] = actions.select_tab,
        ['s'] = actions.select_vertical,
        ['h'] = actions.select_horizontal,
        ['d'] = actions.delete_buffer,
      },
      i = {
        ['<c-k>'] = actions.move_selection_previous,
        ['<c-j>'] = actions.move_selection_next,
        ['<c-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      previewer = false,
      theme = 'dropdown',
    },
    buffers = {
      previewer = false,
      theme = 'dropdown',
      initial_mode = 'normal',
    },
    live_grep = { path_display = { 'hidden' } },
  },
})

telescope.load_extension 'fzf'

local k = vim.keymap

k.set('n', '<leader>ff', builtin.find_files, {})
k.set('n', '<leader>fg', builtin.live_grep, {})
k.set('n', '<leader>fb', builtin.buffers, {})
k.set('n', '<leader>fh', builtin.help_tags, {})

k.set('n', '<leader>fd', builtin.lsp_definitions, {})
k.set('n', '<leader>fi', builtin.lsp_implementations, {})
k.set('n', '<leader>fr', builtin.lsp_references, {})
