vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps --
-- --------------- --

-- the essentials
keymap.set("n", ";", ":")
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- basic quit & save
keymap.set("n", "<leader>w", ":w<cr>")
keymap.set("n", "<leader>q", ":q<cr>")
keymap.set("n", "<leader>a", ":x<cr>")

-- Toggle file explorer
keymap.set("n", "<leader>e", ":Rexplore<cr>")

-- center on page navigation
keymap.set("n", "<c-d>", "<c-d>zz")
keymap.set("n", "<c-u>", "<c-u>zz")
keymap.set("n", "<c-f>", "<c-f>zz")
keymap.set("n", "<c-b>", "<c-b>zz")

-- center on search traveling
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- no search highlight
keymap.set("n", "<leader>h", ":nohl<cr>")

-- keep position on line lifting
keymap.set("n", "J", "mzJ`z")

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

-- paste and replace selected line
keymap.set("x", "<leader>p", "\"_dP")

-- quickfix navigation
keymap.set("n", "]q", ":cnext<cr>")
keymap.set("n", "[q", ":cprevious<cr>")

-- Plugin keymaps --
-- -------------- --

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<cr>")
