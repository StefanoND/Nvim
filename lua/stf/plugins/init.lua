return {
  { -- colorscheme
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("stf.config.catppuccin")
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
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("stf.config.devicons")
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
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
      })
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
      "nvim-telescope/telescope-symbols.nvim",
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
    after = "catppuccin",
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
  -- {
  --   "ThePrimeagen/refactoring.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("stf.config.refactoring")
  --   end,
  -- },
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
    config = function()
      require("stf.config.surround")
    end,
  },
  {
    "cdelledonne/vim-cmake",
    config = function()
      require("stf.config.cmake")
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
      require("stf.config.obsidian")
    end,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("stf.config.neorg")
    end,
    build = ":Neorg sync-parsers",
  },
  {
    "epwalsh/pomo.nvim",
    version = "*",
    lazy = false,
    cmd = { "TimerStart", "TimerRepeat" },
    dependencies = {
      "rcarriga/nvim-notify",
    },
    config = function()
      require("stf.config.pomodoro")
    end,
  },
  -- {
  --   "tpope/vim-dadbod",
  --   opt = true,
  --   requires = {
  --     "kristijanhusak/vim-dadbod-ui",
  --     "kristijanhusak/vim-dadbod-completion",
  --   },
  --   config = function()
  --     require("stf.config.dadbod").setup()
  --   end,
  -- },
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
  -- {
  --   "folke/twilight.nvim",
  --   cmd = { "TwilightEnable" },
  --   config = function()
  --     require("stf.config.twilight")
  --   end,
  -- },
  {
    "Exafunction/codeium.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = { "kevinhwang91/nvim-hlslens", "kevinhwang91/nvim-ufo" },
    config = function()
      require("stf.config.scrollbar")
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("stf.config.hlslens")
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("stf.config.ufo")
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("stf.config.indent")
    end,
  },
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   config = function()
  --     require("colorizer").setup()
  --   end,
  -- },
  {
    "ThePrimeagen/vim-be-good",
    config = function()
      vim.keymap.set("n", "<leader>vb", ":VimBeGood<CR>", { noremap = true, silent = true })
    end,
  },
}
