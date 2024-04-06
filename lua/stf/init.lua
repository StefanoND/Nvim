vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("stf.lazy")

local augroup = vim.api.nvim_create_augroup
local StfGroup = augroup("Stf", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = StfGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("stf.set")
require("stf.remap")

-- Load ftplugin files
local ftmodule = "ftplugin.%s"
local function loadftmodule(ft, action)
  local modname = ftmodule:format(ft)
  local _, res = pcall(require, modname)
  if type(res) == "table" then
    if type(res[action]) == "function" then
      res[action]()
    end
  elseif
    type(res) == "string"
    and not res:match("Module '" .. modname .. "' not found")
    and not res:match("	no file")
  then
    print(res)
  end
end

vim.api.nvim_create_autocmd(
  { "FileType", "BufEnter", "BufWinEnter", "Colorscheme" },
  {
    pattern = { "*" },
    callback = function()
      loadftmodule(vim.bo.filetype, "ftplugin")
    end,
  }
)

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    loadftmodule(vim.bo.filetype, "newfile")
  end,
})

vim.api.nvim_create_autocmd(
  { "FileType", "BufEnter", "VimEnter", "BufWinEnter", "Colorscheme" },
  {
    pattern = { "*" },
    callback = function()
      loadftmodule(vim.bo.filetype, "syntax")
    end,
  }
)
-- ftplugin end
