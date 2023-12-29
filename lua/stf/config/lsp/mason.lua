local mason = require("mason")
-- local mason_lspconfig = require('mason-lspconfig')

mason.setup({
	ensure_installed = {
		-- BASH
		"bash-language-server",
		"bash-debug-adapter", -- DAP
		"shellharden", -- formatter and linter
		-- C/C++
		-- 'cpptools', -- DAP
		"clangd",
		"codelldb", -- DAP
		"clang-format", -- formatter
		"cpplint", -- linter
		-- CMAKE
		"cmake-language-server",
		"cmakelang", -- formatter and linter
		-- CSHARP
		"csharp-language-server",
		"omnisharp",
		"omnisharp-mono",
		"csharpier", -- formatter
		-- GODOT SCRIPT
		"gdscript",
		"gdtoolkit", -- formatter and linter
		-- JSON
		"biome", -- formatter and linter
		-- LUA
		"lua-language-server",
		"stylua", -- formatter and linter
		-- RUST cpptools and ast-grep
		"rust_analyzer",
		"rustfmt",
		-- SQL
		"sqlls",
		"sql-formatter", -- formatter
		"sqlfluff", -- linter
		-- YAML
		"yaml-language-server",
		"prettier", -- formatter
		"yamllint", -- linter
	},
})

-- LSP
-- mason_lspconfig.setup({
--     ensure_installed = {
--         -- BASH
--         'bashls',
--         -- C/C++
--         'clangd',
--         -- CMAKE
--         'cmake',
--         -- CSHARP
--         'csharp_ls',
--         'omnisharp',
--         'omnisharp_mono',
--         -- GODOT SCRIPT
--         'gdscript',
--         -- JSON
--         'jsonls',
--         -- LUA
--         'lua_ls',
--         -- RUST
--         'rust_analyzer',
--         -- SQL
--         'sqlls',
--         -- YAML
--         'yamlls'
--     },
-- })
--
-- local lspconfig = require("lspconfig")
-- local lsp_defaults = lspconfig.util.default_config
--
-- lsp_defaults.capabilities = {
-- 	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities()),
-- }
--
-- mason_lspconfig.setup_handlers({
--         -- The first entry (without a key) will be the default handler
--         -- and will be called for each installed server that doesn't have
--         -- a dedicated handler.
--         function (server_name) -- default handler (optional)
--             require("lspconfig")[server_name].setup {}
--         end,
--
--         function(omnisharp)
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
-- 	local function buf_set_keymap(...)
-- 		vim.api.nvim_buf_set_keymap(bufnr, ...)
-- 	end
-- 	local function buf_set_option(...)
-- 		vim.api.nvim_buf_set_option(bufnr, ...)
-- 	end
--
-- 	-- Omnicompletion
-- 	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
--
-- 	local opts = { noremap = true, silent = true }
-- 	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- 	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- 	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- 	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
-- 	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
-- 	buf_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--
-- 	print("hello omnisharp")
-- end
--
-- -- Omnisharp/C#/Unity
-- local pid = vim.fn.getpid()
-- local omnisharp_bin
--
-- -- Must be version 1.39.8, versions 1.39.9 - 1.39.11 (latest as of this writing) are causing issues:
-- --     "Error executing luv callback... Attempt to Index Local 'decoded' (a nil value)..."
-- -- Will update when this gets fixed (and if I remember)
-- if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1 then
--     lspconfig.powershell_es.setup({
--         bundle_path = "path/to/your/bundle_path",
--         init_options = {
--             enableProfileLoading = false,
--         },
--     })
-- 	omnisharp_bin = os.getenv("UserProfile") .. "/AppData/Local/nvim/omnisharp-win-x64_1.39.8/OmniSharp.exe"
-- else
-- 	omnisharp_bin = os.getenv("HOME") .. "/.config/nvim/omnisharp-linux-x64_1.39.8/run"
-- end
--
-- require("lspconfig").omnisharp.setup({
-- 	on_attach = on_attach,
-- 	flags = {
-- 		debounce_text_changes = 150,
-- 	},
-- 	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
-- 	capabilities = omnicapabilities,
-- })
-- end,
-- function(lua_ls)
-- lspconfig.lua_ls.setup({
-- 	on_attach = function(client, bufnr)
-- 		print("hello lua")
-- 	end,
-- 	capabilities = lsp_defaults,
-- })
-- end,
--
--         -- Next, you can provide a dedicated handler for specific servers.
--         -- For example, a handler override for the `rust_analyzer`:
--         -- ["rust_analyzer"] = function ()
--         --     require("rust-tools").setup {}
--         -- end
--     })
