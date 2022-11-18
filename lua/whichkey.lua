local whichkey = require("which-key")

whichkey.setup({
	plugins = {
		spelling = { enabled = true }
	},
	window = {
		border = "single"
	},
	layout = {
		height = { min = 4 },
		width = { min = 10 },
		spacing = 5,
	}
})
