local rp_status, rose_pine = pcall(require, "rose-pine")
if not rp_status then
  print("rose-pine not found!")
  return
end

rose_pine.setup()

local status, _ = pcall(vim.cmd, "colorscheme rose-pine")

if not status then
  print("Colorscheme rose-pine not found!")
  return
end
