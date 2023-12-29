local mason = require("mason")

mason.setup({
	ensure_installed = {
		-- BASH
		"bash-language-server", -- LSP
		"bash-debug-adapter", -- DAP
		"shellharden", -- formatter and linter
		-- C/C++
		-- 'cpptools', -- DAP
		"clangd", -- LSP
		"codelldb", -- DAP
		"clang-format", -- formatter
		"cpplint", -- linter
		-- CMAKE
		"cmake-language-server", -- LSP
		"cmakelang", -- formatter and linter
		-- CSHARP
		"csharp-language-server", -- LSP
		"omnisharp", -- LSP
		"omnisharp-mono", -- LSP
		"csharpier", -- formatter
		-- GODOT SCRIPT
		"gdscript", -- LSP
		"gdtoolkit", -- formatter and linter
		-- JSON
		"biome", -- formatter and linter
		-- LUA
		"lua-language-server", -- LSP
		"stylua", -- formatter and linter
		-- RUST cpptools and ast-grep
		"rust_analyzer", -- LSP
		-- SQL
		"sqlls", -- LSP
		"sql-formatter", -- formatter
		"sqlfluff", -- linter
		-- YAML
		"yaml-language-server", -- LSP
		"prettier", -- formatter
		"yamllint", -- linter
	},
})
