local catppuccin = require("catppuccin")

-- Load the colorscheme here
vim.cmd.colorscheme("catppuccin")

catppuccin.setup({
  integrations = {
    cmp = true,
    fidget = true,
    gitsigns = true,
    harpoon = true,
    mason = true,
    dap = true,
    dap_ui = true,
    nvimtree = true,
    treesitter = true,
    treesitter_context = true,
    ufo = true,
    rainbow_delimiters = true,
    telescope = true,
    lsp_trouble = true,
    gitgutter = true,
    which_key = true,
    notify = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
})
