-- global settings
vim.opt_global.shell = "fish"
vim.g.must_lsp = {
	"sumneko_lua",
	"jedi_language_server",
	"gopls",
	"svelte",
	"tsserver",
	"tailwindcss",
	"emmet_ls",
	"marksman",
	"sourcery",
}

-- appearance
vim.cmd([[highlight WinSeparator guibg=none]])
vim.o.cursorline = true
vim.o.laststatus = 3
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.list = true
vim.opt.listchars = {
	eol = '⏎',
	tab = '-',
	trail = '·',
}

-- mouse
vim.cmd([[set mouse+=a]])
vim.opt.hidden = true

-- indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- glrnvim
if vim.g.glrnvim_gui then
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			vim.cmd('cd %:p:h')
		end
	})
end

-- disable diagnostics inline texts
vim.diagnostic.config({
	virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
