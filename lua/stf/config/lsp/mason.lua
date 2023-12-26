local mason = require('mason')
-- local mason_lspconfig = require('mason-lspconfig')

mason.setup({
    ensure_installed = {
        -- BASH
        'bash-language-server',
        'bash-debug-adapter', -- DAP
        'shellharden',        -- formatter and linter
        -- C/C++
        -- 'cpptools', -- DAP
        'clangd',
        'codelldb',     -- DAP
        'clang-format', -- formatter
        'cpplint',      -- linter
        -- CMAKE
        'cmake-language-server',
        'cmakelang',    -- formatter and linter
        -- CSHARP
        'csharp-language-server',
        'omnisharp',
        'omnisharp-mono',
        'csharpier',    -- formatter
        -- GODOT SCRIPT
        'gdscript',
        'gdtoolkit',    -- formatter and linter
        -- JSON
        'biome',        -- formatter and linter
        -- LUA
        'lua-language-server',
        'stylua',     -- formatter and linter
        -- RUST cpptools and ast-grep
        'rust_analyzer',
        'rustfmt',
        -- SQL
        'sqlls',
        'sql-formatter', -- formatter
        'sqlfluff',      -- linter
        -- YAML
        'yaml-language-server',
        'prettier',      -- formatter
        'yamllint',      -- linter
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
