local api = vim.api
local gpinit = api.nvim_create_augroup("Init", { clear = true })

-- Auto-reload init.lua on save
api.nvim_create_autocmd("BufWritePost", {
	pattern = "init.lua",
	callback = function()
		vim.cmd [[so %]]
	end,
	group = gpinit
})

-- Run PackerSync on save
api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	callback = function()
		vim.cmd [[so % | PackerSync]]
	end,
	group = gpinit
})

-- autoformat on save
api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*" },
	callback = function()
		vim.cmd [[lua vim.lsp.buf.formatting_sync()]]
	end,
	group = gpinit
})

-- export file to pdf
function _EXPORT_PDF()
	local ft = vim.bo.filetype
	if ft == 'plaintex' then
		vim.cmd('!pdflatex % -output-directory=%:p:h >/dev/null 2>&1')
	else
		vim.cmd [[echo 'Filetype not supported']]
	end
end

function _READ_PDF()
	local ft = vim.bo.filetype
	if ft == 'pdf' or ft == 'plaintex' then
		vim.cmd('!zathura --synctex-forward :: %:r.pdf &')
		vim.cmd('redraw!')
	elseif ft == 'markdown' then
		vim.cmd [[TermExec cmd='glow %:p:r.md' dir='%:p:h']]
	else
		vim.cmd [[echo 'Filetype not supported!']]
	end
end

-- runner
function _RUNNER()
	local ft = vim.bo.filetype
	if ft == 'python' then
		vim.cmd [[TermExec cmd='python %:p:r.py' dir='%:p:h']]
	elseif ft == 'go' then
		vim.cmd [[TermExec cmd='go run %:p:r.go' dir='%:p:h']]
	else
		vim.cmd [[echo 'Filetype not supported']]
	end
end
