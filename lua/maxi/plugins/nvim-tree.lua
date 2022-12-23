local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- strongly advised by the plugin docs
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  actions = {
    open_file = {
      window_picker = {
        enable = false
      },
    },
  },
})
