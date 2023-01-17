local status, _ = pcall(vim.cmd, "colorscheme nord")

if not status then
  print("Colorscheme not found!")
  return
end

vim.cmd "highlight StatusLine guifg=#ECEFF4 guibg=#434C5E"
vim.cmd "highlight StatusLineNC guifg=#D9DEE8 guibg=#3B4252"
vim.cmd "highlight TabLineSel guifg=#D9DEE8 guibg=#4E5668"
