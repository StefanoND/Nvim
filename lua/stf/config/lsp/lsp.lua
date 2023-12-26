local lsp = require("lsp-zero")
--lsp.extend_lspconfig()

lsp.preset("recommended")

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    }
})

-- lsp.format_on_save({
--     format_opts = {
--         async = false,
--         timeout_ms = 10000,
--     },
--     servers = {
--         -- BASH
--         ['bashls'] = { 'bash', 'sh' },
--         -- C/C++
--         ['clang-formatter'] = { 'cpp', 'h', 'hpp', 'c++', 'c', 'objc', 'objcpp', 'cuda', 'proto' },
--         -- CMAKE
--         ['cmake'] = { 'cmake' },
--         -- C Sharp
--         ['csharp-language-server'] = { 'c#', 'c_sharp', 'cs' },
--         ['omnisharp'] = { 'c#', 'c_sharp', 'cs', 'vb' },
--         ['omnisharp-mono'] = { 'c#', 'c_sharp', 'cs', 'vb' },
--         -- Godot Script
--         ['gdscript'] = { 'gd', 'gdscript', 'gdscript3', 'gdscript4' },
--         -- JSON
--         ['biome'] = { 'json', 'jsonc', 'json5' },
--         -- LUA
--         ['lua-language-server'] = { 'lua' },
--         -- RUST
--         ['rust-analyzer'] = { 'rust', 'rs' },
--         -- SQL
--         ['sqlls'] = { 'sql', 'mysql' },
--         -- YAML
--         ['yaml-language-server'] = { 'yaml', 'yaml.docker-compose' },
--         --['sqlls'] = { 'sql' },
--         -- if you have a working setup with null-ls
--         -- you can specify filetypes it can format.
--         -- ['null-ls'] = {'javascript', 'typescript'},
--         ['null-ls'] = { 'bash', 'sh', 'cpp', 'h', 'hpp', 'c++', 'c', 'objc', 'objcpp', 'cuda', 'proto', 'cmake', 'c#', 'c_sharp', 'cs', 'vb', 'gd', 'gdscript', 'gdscript3', 'gdscript4', 'json', 'jsonc', 'lua', 'rust', 'sql', 'mysql', 'yaml', 'yaml.docker-compose' }
--     }
-- })

lsp.setup()
