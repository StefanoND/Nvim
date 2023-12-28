-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false

if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1 then
  vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir" -- Must create this folder
else
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Must create this folder
end

vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- If mixed case in search, assumes case-sensitive

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Split
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.mousemoveevent = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "110"
