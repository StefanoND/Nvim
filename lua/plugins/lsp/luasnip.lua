return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  build = function()
    if vim.fn.has("win64") ~= 1 and vim.fn.has("win32") ~= 1 and vim.fn.has("win16") ~= 1 then
      return "make install_jsregexp"
    end
  end,
  config = function()
    local luasnip = require("luasnip")

    local opts = { noremap = true, silent = true }

    -- require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
    -- require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "all" } })

    luasnip.filetype_extend("lua", { "luadoc" })
    luasnip.filetype_extend("sh", { "shelldoc" })

    vim.keymap.set("i", "<C-s>e", function()
      luasnip.expand()
    end, opts)
    vim.keymap.set({ "i", "s" }, "<C-s>,", function()
      luasnip.jump(1)
    end, opts)
    vim.keymap.set({ "i", "s" }, "<C-s>.", function()
      luasnip.jump(-1)
    end, opts)
    vim.keymap.set({ "i", "s" }, "<C-s>c", function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end, opts)
  end,
}
