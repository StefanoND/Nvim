local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.setup()

-- Change these to the correct path
--vim.opt.undodir = os.getenv("HOME")
local nwdocs = os.getenv("HOME") .. "/Documents/Neverwinter Nights"
local nwroot = os.getenv("HOME") .. "/.local/share/Steam/steamapps/common/Neverwinter Nights"

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

vim.api.nvim_exec(
  [[
  autocmd FileType nwscript setlocal lsp
  ]],
  false
)

if not configs.nwscript_language_server then
  configs.nwscript_language_server = {
    default_config = {
      -- cmd = { "nwscript-language-server" },
      cmd = { "nwscriptd" },
      filetypes = { "nwscript", "nss" },
      root_dir = lspconfig.util.root_pattern(".git", "nasher.cfg"),
    },
  }
end

local nwscriptfuncs = function(client, bufnr)
  local set = vim.keymap.set
  local opts = { buffer = bufnr, noremap = true, remap = false }
  -- Will keep using nwnsc since nwn_script_comp doesn't compile includes and doesn't support external pragma directives
  set("n", "<leader>nb", ":terminal nasher compile -f '%:p'<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Compile current script",
  })
  set("n", "<leader>ncb", ":terminal nasher compile --clean -f '%:p'<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Compile current script",
  })
  set("n", "<leader>nB", ":terminal nasher compile all<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Compile all scripts",
  })
  set("n", "<leader>ncB", ":terminal nasher compile --clean all<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Compile all scripts",
  })
  set("n", "<leader>ni", ":terminal nasher install -y main<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Pack project into module",
  })
  set("n", "<leader>nci", ":terminal nasher install --clean -y main<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Pack project into module",
  })
  set("n", "<leader>nu", ":terminal nasher unpack -y main<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Unpack module to project folder",
  })
  set("n", "<leader>ncu", ":terminal nasher unpack --clean -y main<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Unpack module to project folder",
  })
  set("n", "<leader>tg", ":NWScriptTagGen<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Generate ctags for current project",
  })
  set("n", "<leader>tG", ":NWScriptTagGenAll<CR>", opts)
  vim.tbl_deep_extend("force", opts, {
    desc = "Generate ctags for current project including external directories. Check plugins/lsp/init.lua for more information.",
  })
end

local augroup = vim.api.nvim_create_augroup("NWScript", {})
local nwscriptrefresh = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.cmd("LspRestart")
    end,
  })
end

return {
  lspconfig.nwscript_language_server.setup({
    handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = "rounded" }
      ),
    },
    on_attach = function(client, bufnr)
      nwscriptfuncs(client, bufnr)
      nwscriptrefresh(bufnr)
      print("Hello NWScript")
      require("lsp_signature").on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded",
        },
      }, bufnr)

      -- vim.cmd([[
      --     set syntax=nwscript.doxygen
      --     hi! link doxygenStartL Comment
      --     hi! link doxygenParam Special
      --     hi! link doxygenParamName Special
      --     hi! link doxygenSpecialOneLineDesc Comment
      --     hi! link doxygenSpecialTypeOneLineDesc Special
      --     hi! link doxygenBOther Special
      --     hi! link doxygenBriefWord Special
      --     hi! link doxygenBrief Comment
      --     hi! TSComment gui=NONE
      --   ]])

      -- Enable snippet support (if your completion plugin supports snippets)
    end,
    settings = {
      -- ["nwscript-language-server"] = {
      ["nwscriptd"] = {
        disableSnippets = "off",
      },
      ["nwscript-ee-lsp"] = {
        autoCompleteFunctionsWithParams = true,
        includeCommentsInFunctionsHover = true,
        formatter = {
          enabled = true,
        },
        compiler = {
          enabled = true,
          verbose = true,
          nwnHome = nwdocs,
          nwnInstallation = nwroot,
        },
      },
    },
    capabilities = lspconfig.util.default_config,
  }),
}
