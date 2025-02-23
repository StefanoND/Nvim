return {
  {
    "echasnovski/mini.surround",
    lazy = false,
    version = false,
    config = function()
      require("mini.surround").setup({})
      local opts = { noremap = true, silent = true }
      vim.keymap.set({ "n", "x" }, "s", "<Nop>", opts)
    end,
  },
  {
    "dapt4/vim-autoSurround",
    lazy = false,
    config = function()
      local opts = { noremap = true, silent = true }

      local keymaps = function()
        -- (N)ORG
        if vim.bo.filetype == "org" or vim.bo.filetype == "norg" then
          vim.keymap.set("v", "s*", ':call AutoSurround("*","*")<CR>', opts)
          vim.keymap.set("v", "s/", ':call AutoSurround("/","/")<CR>', opts)
          vim.keymap.set("v", "s_", ':call AutoSurround("_","_")<CR>', opts)
          vim.keymap.set("v", "s-", ':call AutoSurround("-","-")<CR>', opts)
          vim.keymap.set("v", "s!", ':call AutoSurround("!","!")<CR>', opts)
          vim.keymap.set("v", "s`", ':call AutoSurround("`","`")<CR>', opts)
          vim.keymap.set("v", "s^", ':call AutoSurround("^","^")<CR>', opts)
          vim.keymap.set("v", "s,", ':call AutoSurround(",",",")<CR>', opts)
          vim.keymap.set("v", "s$", ':call AutoSurround("$","$")<CR>', opts)
          vim.keymap.set("v", "s&", ':call AutoSurround("&","&")<CR>', opts)
          vim.keymap.set("v", "s%", ':call AutoSurround("%","%")<CR>', opts)
        end
        -- Markdown
        if vim.bo.filetype == "md" or vim.bo.filetype == "markdown" then
          vim.keymap.set("v", "s**", ':call AutoSurround("**","**")<CR>', opts)
          vim.keymap.set("v", "s_", ':call AutoSurround("_","_")<CR>', opts)
        end
      end

      vim.api.nvim_create_autocmd({ "BufEnter", "LspAttach" }, {
        callback = function()
          keymaps()
        end,
      })
    end,
  },
}
