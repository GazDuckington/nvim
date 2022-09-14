local api = vim.api
local autocmd = api.nvim_create_autocmd
local gpinit = api.nvim_create_augroup("Init", { clear = true })

-- Auto-reload init.lua on save
autocmd("BufWritePost", {
	pattern = "init.lua",
	callback = function()
		vim.cmd([[so %]])
	end,
	group = gpinit,
})

-- Run PackerSync on save
autocmd("BufWritePost", {
	pattern = "plugins.lua",
	callback = function()
		vim.cmd([[so % | PackerSync]])
	end,
	group = gpinit,
})

-- autoformat on save
autocmd("BufWritePre", {
	pattern = { "*" },
	callback = function()
		vim.cmd("lua vim.lsp.buf.formatting_sync()")
	end,
	group = gpinit,
})

-- organize imports on save
-- Go
autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		vim.cmd("silent! GoImport")
	end,
	group = gpinit,
})
-- python
autocmd("BufWritePre", {
	pattern = "*.py",
	callback = function()
		-- vim.cmd("PyrightOrganizeImports")
	end,
	group = gpinit,
})

-- export file to pdf
function _EXPORT_PDF()
	local ft = vim.bo.filetype
	if ft == "plaintex" then
		vim.cmd("!pdflatex % -output-directory=%:p:h >/dev/null 2>&1")
	else
		vim.cmd([[echo 'Filetype not supported']])
	end
end

function _READ_PDF()
	local ft = vim.bo.filetype
	if ft == "pdf" or ft == "plaintex" then
		vim.cmd("!zathura --synctex-forward :: %:r.pdf &")
		vim.cmd("redraw!")
	elseif ft == "markdown" then
		vim.cmd([[Glow]])
	else
		vim.cmd([[echo 'Filetype not supported!']])
	end
end

-- runner
function _RUNNER()
	local ft = vim.bo.filetype
	if ft == "python" then
		vim.cmd([[9TermExec cmd='python %:p:r.py' dir='%:p:h']])
	elseif ft == "go" then
		vim.cmd([[9TermExec cmd='go run .' dir='%:p:h']])
	else
		vim.cmd([[echo 'Filetype not supported']])
	end
end
