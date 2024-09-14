vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Create group which will be cleared on reload so we don't have multiple autocommands
local StfGroup = augroup("Stf", { clear = true })

function R(name)
  require("plenary.reload").reload_module(name)
end

-- Highlight on yank
autocmd("TextYankPost", {
  group = StfGroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- Remove whitespace on save
autocmd({ "BufWritePre" }, {
  group = StfGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("config.set")
require("config.remap")
