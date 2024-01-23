-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.encoding = "utf-8"

-- Tab and indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false

if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1 then
  vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir" -- Must create this folder
else -- I don't own/use a Mac, will update when/if I do
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Must create this folder
end

vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- If mixed case in search, assumes case-sensitive

vim.opt.cursorline = true

-- Use truecolor in the terminal, when it's supported
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Split
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.mousemoveevent = true
vim.opt.scrolloff = 16
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Better completion experience
vim.opt.completeopt = "menu,menuone,preview,noselect"

vim.opt.colorcolumn = "120"

-- Concealer for Neorg
vim.o.conceallevel = 2

-- Leading "᛫"
vim.opt.list = true
vim.opt.listchars:append("lead:᛫")
