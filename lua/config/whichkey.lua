local whichkey = require("which-key")

whichkey.setup({
	plugins = {
		spelling = { enabled = true }
	},
	window = {
		border = "single"
	},
	layout = {
		height = { min = 4, max = 6 },
		width = { min = 10, max = 20 },
		spacing = 5,
	}
})
