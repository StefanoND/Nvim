local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.setup()

local lspconfig = require("lspconfig")

local lsp_defaults = lspconfig.util.default_config
local cmpcapabilities =
  require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

cmpcapabilities.textDocument.completion.completionItem.snippetSupport = true
cmpcapabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

lsp_defaults.capabilities = cmpcapabilities

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
  ),
}

local clangd_ext_opts = require("clangd_extensions").opts

clangd_ext_opts = {
  inlay_hints = {
    inline = false,
  },
  ast = {
    --These require codicons (https://github.com/microsoft/vscode-codicons)
    role_icons = {
      type = "",
      declaration = "",
      expression = "",
      specifier = "",
      statement = "",
      ["template argument"] = "",
    },
    kind_icons = {
      Compound = "",
      Recovery = "",
      TranslationUnit = "",
      PackExpansion = "",
      TemplateTypeParm = "",
      TemplateTemplateParm = "",
      TemplateParamObject = "",
    },
  },
}

local cppfuncs = function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, remap = false }

  vim.keymap.set(
    "n",
    "<leader>cR",
    "<cmd>ClangdSwitchSourceHeader<cr>",
    vim.tbl_deep_extend("force", opts, { desc = "Switch Source/Header (C/C++)" })
  )

  -- switch between header and source file
  vim.keymap.set("n", "<M-o>", function()
    local filename = vim.fn.expand("%:p")
    local new_filename

    if string.match(filename, ".h$") then
      new_filename = string.gsub(filename, ".h$", ".cpp")
    elseif string.match(filename, ".cpp$") then
      new_filename = string.gsub(filename, ".cpp$", ".h")
    end

    if new_filename then
      vim.cmd("e " .. new_filename)
    end
  end, opts)

  -- Unreal.nvim mappings
  vim.keymap.set("n", "<C-b>", "<cmd>UnrealBuild<CR>")
  vim.keymap.set("n", "<F5>", "<cmd>UnrealRun<CR>")
end

return {
  -- Setup DAP ``adapter``
  -- {
  --   "mason-nvim-dap.nvim",
  --   opts = {
  --     ensure_installed = { "`adapter`" },
  --   },
  -- },

  lspconfig.clangd.setup({
    require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, {
      handlers = handlers,
      cmd = {
        "clangd",
        "--offsetEncoding=utf-8",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=microsoft",
      },
      default_config = {
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or require("lspconfig.util").root_pattern(
            "compile_commands.json",
            "compile_flags.txt"
          )(fname) or require("lspconfig.util").find_git_ancestor(fname)
        end,
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },
      on_attach = function(client, bufnr)
        cppfuncs(client, bufnr)

        client.server_capabilities.signatureHelpProvider = false
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4

        print("Hello C/C++")
      end,
      capabilities = lsp_defaults,
    })),
  }),

  -- Setup null-ls with `clang_format`
  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = vim.list_extend(opts.sources, {
  --       nls.builtins.formatting.clang_format.with({
  --         extra_args = {
  --           "-style=file:" .. vim.fn.expand("~/Desktop/Projects/C/.clang-format"),
  --         },
  --       }),
  --     })
  --   end,
  -- },
}
