local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
  return
end

local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
  return
end

local builtin_status, builtin = pcall(require, "telescope.builtin")
if not builtin_status then
  return
end

local utils_status, utils = pcall(require, "telescope.utils")
if not utils_status then
  return
end

local lsp_settings = {
  theme = "ivy",
  initial_mode = "normal",
  path_display = { "smart" },
}

local finder_settings = {
  previewer = false,
  theme = "dropdown",
}

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    initial_mode = "insert",
    dynamic_preview_title = true,
    mappings = {
      i = {
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = finder_settings,
    git_files = finder_settings,
    buffers = {
      previewer = false,
      theme = "dropdown",
      initial_mode = "normal",
    },
    live_grep = { path_display = { "hidden" } },
    lsp_definitions = lsp_settings,
    lsp_implementations = lsp_settings,
    lsp_references = lsp_settings
  },
})

telescope.load_extension("fzf")

local keymap = vim.keymap

local find_files = function()
  local _, ret, _ = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
  if ret == 0 then
    builtin.git_files()
  else
    builtin.find_files()
  end
end

keymap.set("n", "<leader>ff", find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})
keymap.set("n", "<leader>fd", builtin.lsp_definitions, {})
keymap.set("n", "<leader>fi", builtin.lsp_implementations, {})
keymap.set("n", "<leader>fr", builtin.lsp_references, {})
keymap.set("n", "<leader>fc", builtin.git_commits, {})
