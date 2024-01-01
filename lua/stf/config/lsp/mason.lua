local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup({
	ensure_installed = {
		-- BASH
		"bash-language-server", -- LSP
		"bash-debug-adapter", -- DAP
		-- "shellharden", -- formatter and linter
		-- C/C++
		-- 'cpptools', -- DAP
		"clangd", -- LSP
		"codelldb", -- DAP
		-- "clang-format", -- formatter
		"cpplint", -- linter
		-- CMAKE
		"cmake-language-server", -- LSP
		-- "cmakelang", -- formatter and linter
		-- GODOT SCRIPT
		"gdscript", -- LSP
		-- "gdtoolkit", -- formatter and linter
		-- JSON
		-- "biome", -- formatter and linter
		-- LUA
		"lua-language-server", -- LSP
		-- "stylua", -- formatter and linter
		-- RUST cpptools and ast-grep
		"rust_analyzer", -- LSP
		-- SQL
		"sqlls", -- LSP
		-- "sql-formatter", -- formatter
		"sqlfluff", -- linter
		-- YAML
		"yaml-language-server", -- LSP
		-- "prettier", -- formatter
		"yamllint", -- linter
	},

	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed

	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_tool_installer.setup({
	ensure_installed = {
		"shellharden", -- bash formatter and linter
		"clang-format", -- C/C++ formatter
		"cmakelang", -- CMAKE formatter and linter
		"gdtoolkit", -- Godot formatter and linter
		"biome", -- formatter and linter
		"stylua", -- Lua formatter and linter
		"sql-formatter", -- SQL formatter
		"prettier", -- Prettier formatter
	},
})
