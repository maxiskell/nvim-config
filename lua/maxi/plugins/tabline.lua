local status, tabline = pcall(require, "tabline")
if not status then
  return
end

tabline.setup({
  show_index = false,
  show_modify = true,
  show_icon = false,
  fnamemodify = ':t',
  modify_indicator = '*',
  no_name = 'No name',
  brackets = { '', '' },
  inactive_tab_max_length = 0
})
