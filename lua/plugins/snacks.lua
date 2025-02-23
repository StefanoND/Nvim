local Snacks = require("snacks")
local opts = { noremap = true, silent = true }
local extend = function(desc)
  vim.tbl_deep_extend("force", opts, { desc = desc })
end

_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
vim.print = _G.dd

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    animate = { enabled = false },
    bigfile = {
      enabled = true,
      notify = true, -- show notification when big file detected
      size = 2.5 * 1024 * 1024, -- 2.5MB
      line_length = 1000, -- average line length (useful for minified files)
      -- Enable or disable features when big file detected
      ---@param ctx {buf: number, ft:string}
      setup = function(ctx)
        if vim.fn.exists(":NoMatchParen") ~= 0 then
          vim.cmd([[NoMatchParen]])
        end
        Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
        vim.b.minianimate_disable = true
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(ctx.buf) then
            vim.bo[ctx.buf].syntax = ctx.ft
          end
        end)
      end,
    },
    bufdelete = { enabled = false },
    dashboard = { enabled = false },
    debug = { enabled = true },
    dim = { enabled = false },
    explorer = {
      enabled = true,
      replace_netrw = true, -- Replace netrw with the snacks explorer
    },
    git = {
      enabled = true,
    },
    gitbrowse = {
      enabled = true,
      notify = true,
    },
    image = { enabled = true },
    indent = {
      enabled = true,
      chunk = {
        enabled = true,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
        },
      },
    },
    input = { enabled = true },
    layout = { enabled = false },
    lazygit = { enabled = true },
    notifier = { enabled = false }, -- Doesn't work well with pomodoro
    notify = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          auto_close = true,
        },
      },
    },
    profiler = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    scratch = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    terminal = { enabled = true },
    toggle = { enabled = true },
    util = { enabled = true },
    win = { enabled = true },
    words = { enabled = true },
    zen = { enabled = false },
  },
  keys = {
    {
      "<leader>op",
      function()
        Snacks.explorer.open(opts)
      end,
      extend("Open File Explorer"),
    },
    {
      "<leader>gS",
      function()
        Snacks.gitbrowse.open(opts)
      end,
      extend("Open the repository of active file in the browser"),
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit(opts)
      end,
      extend("Opens lazygit"),
    },
    {
      "<leader>gll",
      function()
        Snacks.lazygit.log(opts)
      end,
      extend("Opens lazygit with the log view"),
    },
    {
      "<leader>glf",
      function()
        Snacks.lazygit.log_file(opts)
      end,
      extend("Opens lazygit with the log of the current file"),
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      extend("Toggle Scratch Buffer"),
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      extend("Select Scratch Buffer"),
    },
  },
}
