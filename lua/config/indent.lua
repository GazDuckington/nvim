local scheme = name(vim.g.colors_name)
if scheme == nil then
	scheme = "mocha"
end
local color = require("catppuccin.palettes").get_palette(scheme)
local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}
local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = color.red })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = color.yellow })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = color.blue })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = color.peach })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = color.green })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = color.mauve })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = color.sky })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
