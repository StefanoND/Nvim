local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.preset("recommended")

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "»",
	},
})

lsp.setup()

local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local cmpcapabilities = cmp_lsp.default_capabilities()
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = cmpcapabilities

local clangcapabilities = lsp_defaults
clangcapabilities.capabilities = {
	offsetEncoding = "utf-8",
	lsp_defaults.capabilities,
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(client, bufnr)
		-- local on_attach = function(client, bufnr)
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, opts)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("i", "<C-k>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>gR", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "go", function()
			vim.lsp.buf.type_definition()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)

		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)

		vim.keymap.set({ "n", "x" }, "<leader>f", function()
			vim.lsp.buf.format({ async = true, timeout_ms = 10000 })
		end, opts)
	end,
})

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig.bashls.setup({
	on_attach = function(client, bufnr)
		print("hello bash")
	end,
	capabilities = lsp_defaults,
})

lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		print("hello clang")
	end,
	capabilities = clangcapabilities,
})

lspconfig.cmake.setup({
	on_attach = function(client, bufnr)
		print("hello cmake")
	end,
	capabilities = lsp_defaults,
})

lspconfig.gdscript.setup({
	on_attach = function(client, bufnr)
		print("hello godot")
	end,
	capabilities = lsp_defaults,
})

lspconfig.jsonls.setup({
	on_attach = function(client, bufnr)
		print("hello json")
	end,
	capabilities = lsp_defaults,
})

lspconfig.lua_ls.setup({
	on_attach = function(client, bufnr)
		print("hello lua")
	end,
	capabilities = lsp_defaults,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lspconfig.rust_analyzer.setup({
	on_attach = function(client, bufnr)
		print("hello rust")
	end,
	capabilities = lsp_defaults,
})

lspconfig.sqlls.setup({
	on_attach = function(client, bufnr)
		print("hello sql")
	end,
	capabilities = lsp_defaults,
})

lspconfig.yamlls.setup({
	on_attach = function(client, bufnr)
		print("hello yaml")
	end,
	capabilities = lsp_defaults,
})

vim.diagnostic.config({
	virtual_text = true,
})
