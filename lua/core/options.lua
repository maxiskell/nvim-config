local o = vim.opt

-- appearance
o.signcolumn = 'yes'
o.background = 'light'
o.termguicolors = true

-- line numbers
o.number = true
o.relativenumber = true

-- tabs & inddentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
vim.cmd 'autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4'

-- no line wrapping
o.wrap = false

-- leave some room
o.scrolloff = 8

-- search
o.ignorecase = true
o.smartcase = true

-- backspace
o.backspace = 'indent,eol,start'

-- split windows
o.splitright = true
o.splitbelow = true

-- only the current split status
o.laststatus = 3

-- no swaps or backups
o.swapfile = false
o.backup = false

-- undo file
o.undofile = true
o.undodir = os.getenv 'HOME' .. '/.nvim/undodir'

-- quick refresh
o.updatetime = 50

-- highlight on yank
vim.cmd [[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]]
