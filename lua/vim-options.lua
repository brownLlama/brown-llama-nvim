vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Select all
vim.keymap.set("n", "<c-a>", "ggVG<CR>")

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

-- Is Keyword (considers dash as a word)
vim.o.iskeyword = vim.o.iskeyword .. ",-"
