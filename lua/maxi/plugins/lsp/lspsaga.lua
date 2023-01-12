local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.init_lsp_saga({
  code_action_icon = "",
  move_in_saga = { prev = "<c-k>", next = "<c-j>" },
  finder_action_keys = { open = "<cr>" },
  definition_action_keys = { edit = "<cr>" },
})
