return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  config = function()
    require("refactoring").setup({
      prompt_func_return_type = {
        go = false,
        java = false,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
      },
      prompt_func_param_type = {
        go = false,
        java = false,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
      },
      printf_statements = {},
      print_var_statements = {},
      show_success_message = false, -- shows a message with information about the refactor on success
      -- i.e. [Refactor] Inlined 3 variable occurrences
    })

    local opts = { noremap = true, silent = true, expr = false }

    vim.keymap.set("x", "<leader>re", function()
      require("refactoring").refactor("extract ")
    end, opts)
    vim.keymap.set("x", "<leader>rf", function()
      require("refactoring").refactor("extract_to_file ")
    end, opts)
    -- Extract function supports only visual mode
    vim.keymap.set("x", "<leader>rv", function()
      require("refactoring").refactor("extract_var ")
    end, opts)
    -- Extract variable supports only visual mode
    vim.keymap.set("n", "<leader>rI", function()
      require("refactoring").refactor("inline_func")
    end, opts)
    -- Inline func supports only normal
    vim.keymap.set({ "n", "x" }, "<leader>ri", function()
      require("refactoring").refactor("inline_var")
    end, opts)
    -- Inline var supports both normal and visual mode

    vim.keymap.set("n", "<leader>rb", function()
      require("refactoring").refactor("extract_block")
    end, opts)
    vim.keymap.set("n", "<leader>rbf", function()
      require("refactoring").refactor("extract_block_to_file")
    end, opts)

    vim.keymap.set("v", "<leader>rdf", ":TSCppDefineClassFunc")
    vim.keymap.set("v", "<leader>rmc", ":TSCppMakeConcreteClass")
    vim.keymap.set("v", "<leader>rro", ":TSCppRuleOf3")
    vim.keymap.set("v", "<leader>rroo", ":TSCppRuleOf5")
  end,
}
