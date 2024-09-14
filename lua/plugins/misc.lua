return {
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
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  "ThePrimeagen/git-worktree.nvim",
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup()
      -- require("notify").setup({
      --   background_colour = "#000000",
      --   enabled = false,
      -- })
    end,
  },
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
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = require("rainbow-delimiters").strategy["global"],
          commonlisp = require("rainbow-delimiters").strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          latex = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      })
    end,
  },
  {
    "ThePrimeagen/vim-be-good",
    config = function()
      vim.keymap.set("n", "<leader>vb", ":VimBeGood<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "szw/vim-maximizer",
    keys = {
      {
        "<leader>sm",
        "<cmd>MaximizerToggle<cr>",
        { desc = "Maximize/Minimize a split", noremap = true, silent = true },
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  {
    "tpope/vim-repeat",
    lazy = true,
    -- use function to overwrite default event, otherwise it just merges with the default
    -- and `VeryLazy` keeps existing
    event = function()
      return { "BufReadPost", "BufNewFile" }
    end,
  },
}
