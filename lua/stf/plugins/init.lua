return {
  { -- colorscheme
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- Load the colorscheme here
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  { -- file explorer for neovim
    "nvim-tree/nvim-tree.lua",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        config = function()
          require("stf.config.devicons")
        end,
      },
    },
    config = function()
      require("stf.config.tree")
    end,
  },
  { -- parser
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("stf.config.treesitter")
    end,
  },
  { -- fast file access
    "theprimeagen/harpoon",
    branch = "harpoon2",
    requires = {
      { "nvim-lua/plenary" },
    },
    config = function()
      require("stf.config.harpoon")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        -- On Windows you'll have to go to ~\AppData\Local\nvim-data\lazy\telescope-fzf-native.nvim
        -- Run these commands while inside "telescope-fzf-native.nvim" folder
        -- make clean
        -- cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release
        -- cmake --build build --config Release
        -- cmake --install build --prefix build
      },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("stf.config.telescope")
    end,
  },
  {
    "mbbill/undotree",
  },
  {
    "tpope/vim-fugitive",
    config = function()
      require("stf.config.fugitive")
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("stf.config.comment")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = function()
      require("stf.config.bufferline")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("stf.config.lualine")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("stf.config.terminal")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      -- Config here
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("stf.config.refactoring")
    end,
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = function()
      require("stf.config.trouble")
    end,
  },
  {
    "eandrju/cellular-automaton.nvim",
    event = "VeryLazy",
  },
  {
    "laytan/cloak.nvim",
    event = "VeryLazy",
    config = function()
      require("stf.config.cloak")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("stf.config.gitsigns")
    end,
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    config = function()
      require("stf.config.visual-multi")
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("stf.config.autopairs")
    end,
  },
  {
    "dapt4/vim-autoSurround",
    lazy = false,
  },
  {
    "cdelledonne/vim-cmake",
    config = function()
      require("stf.config.cmake")
    end,
  },
  {
    "alepez/vim-gtest",
    config = function()
      require("stf.config.gtest")
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
      "preservim/vim-markdown",
      "epwalsh/pomo.nvim",
    },
    config = function()
      require("stf.config.obsidan")
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("stf.config.neorg")
    end,
  },
  {
    "epwalsh/pomo.nvim",
    version = "*",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat" },
    dependencies = {
      "rcarriga/nvim-notify",
    },
    config = function()
      require("stf.config.pomodoro")
    end,
  },
  {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("stf.config.dadbod").setup()
    end,
  },
  "ThePrimeagen/git-worktree.nvim",
  {
    "rmagatti/goto-preview",
    config = function()
      require("stf.config.gotopreview")
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
      require("stf.config.todocomments")
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        enabled = false,
      })
    end,
  },
  "nvim-telescope/telescope-symbols.nvim",
}
