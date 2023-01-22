local whichkey = require("which-key")

whichkey.setup({
	plugins = {
		spelling = { enabled = true }
	},
	window = {
		border = "single"
	},
	layout = {
		spacing = 5,
	}
})
