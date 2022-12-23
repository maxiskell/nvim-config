vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps --
-- --------------- --

-- the essentials
keymap.set("n", ";", ":")
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- basic quit & save
keymap.set("n", "<leader>x", ":x<cr>")
keymap.set("n", "<leader>w", ":w<cr>")
keymap.set("n", "<leader>q", ":q<cr>")

-- center on page navigation
keymap.set("n", "<c-d>", "<c-d>zz")
keymap.set("n", "<c-u>", "<c-u>zz")
keymap.set("n", "<c-f>", "<c-f>zz")
keymap.set("n", "<c-b>", "<c-b>zz")

-- no search highlight
keymap.set("n", "<leader>h", ":nohl<cr>")

-- remove without adding to clipboard
keymap.set("n", "x", '"_x"')

-- increment and decrement a number
keymap.set("n", "+", "<c-a>")
keymap.set("n", "-", "<c-x>")

-- split
keymap.set("n", "<leader>sv", "<c-w>v")
keymap.set("n", "<leader>sh", "<c-w>s")
keymap.set("n", "<leader>se", "<c-w>=")
keymap.set("n", "<leader>sx", ":close<cr>")

-- Splits traveler
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-j>", "<c-w>j")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<c-l>", "<c-w>l")

-- Plugin keymaps --
-- -------------- --

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<cr>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
