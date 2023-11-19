vim.g.mapleader = " "

local k = vim.keymap -- for conciseness

-- GENERAL
-- recenter screen on page up and down
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "<C-d>", "<C-d>zz")

-- dont yank when x is pressed
k.set("n", "x", '"_x')

-- Increment and decrement
k.set("n", "<leader>+", "<C-a>")
k.set("n", "<leader>-", "<C-x>")

-- wrap
-- Add a condition to toggle
k.set("n", "<leader>z", ":set wrap<CR>")

-- move selection in visual mode
k.set("v", "J", ":m '>+1<CR>gv=gv")
k.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep yank in the buffer on paste
k.set("x", "<leader>p", '"_dP')

-- Managing tabs
k.set("n", "<leader>to", ":tabnew<CR>")
k.set("n", "<leader>tq", ":tabclose<CR>")
k.set("n", "<leader>tn", ":tabn<CR>")
k.set("n", "<leader>tp", ":tabp<CR>")
