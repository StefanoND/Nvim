return {
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
    local nv = require("unreal.commands")
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    telescope.load_extension("fzf")

    local builtin = require("telescope.builtin")

    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, opts)
    vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
    vim.keymap.set("n", "<leader>fgf", builtin.git_files, opts)
    vim.keymap.set("n", "<leader>fm", builtin.marks, opts)

    -- find document symbols eitheir through lsp if available
    -- otherwise fallback to treesitter
    vim.keymap.set("n", "<leader>fps", function(opts)
      local bufnr = vim.api.nvim_get_current_buf()
      local winnr = vim.api.nvim_get_current_win()
      local params = vim.lsp.util.make_position_params(winnr)
      vim.lsp.buf_request(bufnr, "textDocument/documentSymbol", params, function(err, result, _, _)
        if err then
          return builtin.treesitter()
        end
        return builtin.lsp_document_symbols()
      end)
    end, {})

    vim.keymap.set("n", "<leader>fwss", builtin.lsp_workspace_symbols, {})
    vim.keymap.set("n", "<leader>fws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, opts)
    vim.keymap.set("n", "<leader>fWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, opts)
    vim.keymap.set("n", "<leader>fs", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, opts)

    require("telescope").load_extension("nerdy")
    vim.keymap.set("n", "<leader>fn", function()
      telescope.extensions.nerdy.nerdy()
    end, opts)
  end,
}
