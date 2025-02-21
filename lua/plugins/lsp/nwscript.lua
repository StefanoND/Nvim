return {
  {
    "jd28/nwscript-lsp",
    dependencies = {
      "ray-x/lsp_signature.nvim",
    },
  },
  {
    "jd28/arclight-py",
  },
  {
    "PhilippeChab/nwscript-ee-language-server",
  },
  { -- Add comment keymaps support for nwscript
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      -- import comment plugin safely
      local comment = require("Comment")

      local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

      local ft = require("Comment.ft")
      ft.set("nwscript", { "//%s", "/*%s*/" })

      -- enable comment
      comment.setup({
        -- for commenting tsx and jsx files
        padding = true,
        sticky = true,
        ignore = "nil",
        toggler = { line = "gcc", block = "gbc" },
        opleader = { line = "gc", block = "gb" },
        extra = { above = "gcO", below = "gco", eol = "gcA" },
        mappings = { basic = true, extra = true },
        pre_hook = ts_context_commentstring.create_pre_hook(),
        post_hook = nil,
      })
    end,
  },
  {
    "squattingmonk/vim-nwscript",
    config = function()
      -- Luascript doesn't work, let's use vim.cmd([[]]) to run Vimscript inside it
      vim.cmd([[
        " Whitelist modules
        let g:nwscript#modules#enabled = ['ctags', 'format']
        " Blacklist modules
        let g:nwscript#modules#disabled = ['fold']

        " Auto-wrap (actually auto-newline) comments at column 105
        " Pressing o/O in normal mode will continua a comment block.
        let g:nwscript#format#textwidth = 105
        let g:nwscript#format#options = 'croqwa2lj'

        " Remove trailing whitespace when saving
        let g:nwscript#format#whitespace = 1

        " Must enable 'fold' above
        " let g:nwscript#fold#method = 'syntax'
        " let g:nwscript#fold#level = &foldlevel
        " let g:nwscript#fold#column = 1

        " If you have your own custom options file for generating tags for NWScript files, set the path here
        " let g:nwscript#ctags#file = '/path/to/nwscript.ctags'

        " Extra directoreis outside your project that will be tagged
        " let g:nwscript#ctags#includes = ['~/.local/share/nwscript']
      ]])
    end,
  },
}
