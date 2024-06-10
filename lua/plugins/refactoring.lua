return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup({
      prompt_func_return_type = {
        go = false,
        java = false,

        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      prompt_func_param_type = {
        go = false,
        java = false,

        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      printf_statements = {},
      print_var_statements = {},
    })

    local opts = { noremap = true, silent = true, expr = false }

    vim.keymap.set("x", "<leader>re", function()
      require("refactoring").refactor("Extract Function")
    end, opts)
    vim.keymap.set("x", "<leader>rf", function()
      require("refactoring").refactor("Extract Function To File")
    end, opts)
    -- Extract function supports only visual mode
    vim.keymap.set("x", "<leader>rv", function()
      require("refactoring").refactor("Extract Variable")
    end, opts)
    -- Extract variable supports only visual mode
    vim.keymap.set("n", "<leader>rI", function()
      require("refactoring").refactor("Inline Function")
    end, opts)
    -- Inline func supports only normal
    vim.keymap.set({ "n", "x" }, "<leader>ri", function()
      require("refactoring").refactor("Inline Variable")
    end, opts)
    -- Inline var supports both normal and visual mode

    vim.keymap.set("n", "<leader>rb", function()
      require("refactoring").refactor("Extract Block")
    end, opts)
    vim.keymap.set("n", "<leader>rbf", function()
      require("refactoring").refactor("Extract Block To File")
    end, opts)

    vim.keymap.set("v", "<leader>rdf", ":TSCppDefineClassFunc")
    vim.keymap.set("v", "<leader>rmc", ":TSCppMakeConcreteClass")
    vim.keymap.set("v", "<leader>rro", ":TSCppRuleOf3")
    vim.keymap.set("v", "<leader>rroo", ":TSCppRuleOf5")
  end,
}
