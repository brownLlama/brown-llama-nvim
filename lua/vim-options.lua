vim.g.mapleader = " "

-- Indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Horizontal Split
vim.keymap.set("n", "<leader>h", "<cmd>vsplit<cr>")

-- Search
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { noremap = true })
vim.o.ignorecase = true
vim.o.smartcase = true

-- Line and relative Number
vim.wo.number = true
vim.wo.relativenumber = true

-- Appreance
vim.o.termguicolors = true
vim.o.signcolor = "yes"

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Backspace
vim.o.backspace = "indent,eol,start"

-- Split Windows
vim.o.splitbelow = true
vim.o.splitright = true

-- Is Keyword
vim.o.iskeyword = vim.o.iskeyword .. ",-"
