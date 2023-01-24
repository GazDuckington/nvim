local whichkey = require("which-key")

whichkey.setup({
	plugins = {
		spelling = { enabled = true }
	},
	window = {
		border = "single"
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	}
})
