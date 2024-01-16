vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local StfFugitive = vim.api.nvim_create_augroup("StfFugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
  group = StfFugitive,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, noremap = true }

    vim.keymap.set("n", "<leader>gfa", function()
      vim.cmd.Git("add")
    end, opts)

    vim.keymap.set("n", "<leader>gfc", function()
      vim.cmd.Git("commit")
    end, opts)

    vim.keymap.set("n", "<leader>gfp", function()
      vim.cmd.Git("push", "-u", "origin", "HEAD")
    end, opts)

    -- rebase always
    vim.keymap.set("n", "<leader>gfPR", function()
      vim.cmd.Git({ "pull", "--rebase" })
    end, opts)
  end,
})
