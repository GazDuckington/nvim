local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.completion.spell,
	null_ls.builtins.completion.luasnip,
	null_ls.builtins.code_actions.refactoring,
	null_ls.builtins.code_actions.xo,
}

null_ls.setup({
	sources = sources
})
