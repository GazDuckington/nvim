local pretty_ft = TableConcat(vim.g.web_filetypes, { "json", "yaml", "toml", "rasi" })
local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.prettier.with({
		filetypes = pretty_ft
	}),
	null_ls.builtins.formatting.black.with({
		filetypes = { "python" },
	}),
}

null_ls.setup({ sources = sources })
