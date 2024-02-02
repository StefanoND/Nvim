local autopairs = require("nvim-autopairs")
-- local endwise = require('nvim-autopairs.ts-rule').endwise
--
-- autopairs.add_rules({
-- -- 'then$' is a lua regex
-- -- 'end' is a match pair
-- -- 'lua' is a filetype
-- -- 'if_statement' is a treesitter name. set it = nil to skip check with treesitter
--     endwise('then$', 'end', 'lua', 'if_statement')
-- })

autopairs.setup({
  check_ts = true, -- Enable treesitter
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
})

autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))

local aprule = require("nvim-autopairs.rule")
local apcond = require("nvim-autopairs.conds")

autopairs.add_rules({
  aprule("*", "*", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("/", "/", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("_", "_", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("-", "-", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("!", "!", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("`", "`", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("^", "^", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule(",", ",", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("$", "$", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("&", "&", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("%", "%", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  -- aprule("", "", { "org", "norg" }):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),

  aprule("**", "**", "markdown"):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
  aprule("_", "_", "markdown"):with_pair(apcond.not_after_regex("[^.,;>)%]}]")),
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
