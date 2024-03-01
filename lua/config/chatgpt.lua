local home = vim.fn.expand("$HOME")
require("chatgpt").setup({
	api_key_cmd = "gpg --homedir $HOME/.gnupg/ --decrypt " .. home .. "/secret.txt.gpg"
})
