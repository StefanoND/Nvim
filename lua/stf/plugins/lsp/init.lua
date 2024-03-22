return {
  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    -- config = function()
    -- 	require("stf.config.lsp.lsp")
    -- end,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      { "jay-babu/mason-null-ls.nvim", event = { "BufReadPre", "BufNewFile" } },
      "nvimtools/none-ls-extras.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("stf.config.lsp.none-ls")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "OmniSharp/omnisharp-vim" },
      { "Hoffs/omnisharp-extended-lsp.nvim" },
    },
    config = function()
      require("stf.config.lsp.lspconfig")
      -- require("stf.config.lsp.omnisharp.omnisharp")
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false,
    config = true,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    lazy = false,
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    build = ":MasonUpdate",
    config = function()
      require("stf.config.lsp.mason")
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "onsails/lspkind.nvim" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "rafamadriz/friendly-snippets" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lua" },
      { "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("stf.config.lsp.cmp")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = function()
      if vim.fn.has("win64") ~= 1 and vim.fn.has("win32") ~= 1 and vim.fn.has("win16") ~= 1 then
        return "make install_jsregexp"
      end
    end,
    config = function()
      require("stf.config.lsp.luasnip")
    end,
  },
  {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter", "L3MON4D3/LuaSnip" },
    config = function()
      require("stf.config.lsp.neogen")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("stf.config.lsp.dap")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
  {
    "rcarriga/cmp-dap",
    dependencies = "mfussenegger/nvim-dap",
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("stf.config.lsp.fidget")
    end,
  },
  {
    "OmniSharp/omnisharp-vim",
    dependencies = {
      "ctrlpvim/ctrlp.vim",
    },
  },
  {
    "habamax/vim-godot",
  },
  {
    "bfrg/vim-cpp-modern",
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

        " Auto-wrap (actually auto-newline) comments at column 120
        " Pressing o/O in normal mode will continua a comment block.
        let g:nwscript#format#textwidth = 120
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
  {
    "jd28/nwscript-lsp",
    dependencies = {
      "ray-x/lsp_signature.nvim",
    },
  },
  -- {
  --   "PhilippeChab/nwscript-ee-language-server",
  -- },
}
