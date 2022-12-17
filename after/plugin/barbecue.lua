require("barbecue").setup({
	symbols = {
		separator = ""
	}
})
-- uncomment to disable by default
require("barbecue.ui").toggle(vim.g.breadcrumb_enabled)
