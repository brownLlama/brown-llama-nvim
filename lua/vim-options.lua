vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set smartindent")
vim.cmd("set cursorline")

-- Select all
vim.keymap.set("n", "<c-a>", "ggVG<CR>")
-- Fine Command Line
-- vim.keymap.set("n", ":", "<cmd>FineCmdline<CR>")

-- No Highlight
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

-- Show Sign Column
vim.o.signcolumn = "yes"

-- Show column Line
vim.o.colorcolumn = "120"
