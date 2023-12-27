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

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
