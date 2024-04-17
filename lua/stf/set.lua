-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.encoding = "utf-8"

vim.g.editorconfig = true

-- " Disable function highlighting (affects both C and C++ files)
vim.g.cpp_function_highlight = 1

-- " Enable highlighting of C++11 attributes
vim.g.cpp_attributes_highlight = 1

-- " Highlight struct/class member variables (affects both C and C++ files)
vim.g.cpp_member_highlight = 1

-- " Put all standard C and C++ keywords under Vim's highlight group 'Statement'
-- " (affects both C and C++ files)
vim.g.cpp_simple_highlight = 1

-- Tab and indentation
vim.opt.tabstop = 2 -- 2 Spaces for tabs
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- 2 Spaces for indent width
vim.opt.expandtab = true -- Expand tab to spaces
vim.opt.smartindent = true
vim.opt.autoindent = true -- Copy indent from current line when starting a new one

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false

if
  vim.fn.has("win64") == 1
  or vim.fn.has("win32") == 1
  or vim.fn.has("win16") == 1
then
  vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir" -- Must create this folder
else -- I don't own/use a Mac, will update when/if I do
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Must create this folder
end

vim.opt.undofile = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- If mixed case in search, assumes case-sensitive

vim.opt.cursorline = true -- Highlight current/cursor line

-- Use truecolor in the terminal, when it's supported
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

vim.opt.background = "dark" -- Colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

vim.opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position

vim.opt.clipboard:append("unnamedplus") -- Use system clipboard as default register

-- Split
vim.opt.splitright = true -- Split vertical window to the right
vim.opt.splitbelow = true -- Split horizontal window to the bottom

vim.opt.mousemoveevent = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Better completion experience
vim.opt.completeopt = "menu,menuone,preview,noselect"

vim.opt.colorcolumn = "100"

-- Concealer for Neorg
vim.o.conceallevel = 2

-- Leading "᛫"
vim.opt.list = true
vim.opt.listchars:append("lead:᛫")

-- Folds
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.cmd("let g:netrw_liststlye = 3")

local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
  vim.fn.serverstart(pipepath)
end
