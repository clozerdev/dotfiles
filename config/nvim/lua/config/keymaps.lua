local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffer nav and operations
keymap.set("n", "<C-n>", "<cmd>bnext<cr>", opts)
keymap.set("n", "<C-p>", "<cmd>bprev<cr>", opts)
keymap.set("n", "<leader>bx", "<cmd>bp | bd #<cr>", opts)
keymap.set("n", "<leader>bd", "<cmd>%bd<cr>", opts)

-- Source files without leaving Neovim
keymap.set("n", "<leader>x", "<cmd>source %<cr>", opts)

-- Better indenting in visual mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
