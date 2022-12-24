local setup, astro = pcall(require, "vim-astro")
if not setup then
  return
end

astro.setup()
