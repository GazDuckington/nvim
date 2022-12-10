# My Simple Neovim Configuration

This repos hosts my nvim configuration for Linux. Specific plugins configurations are stored in the `lua/config/` directory. While general configurations, like keybindings, color scheme, nvim options and the like, are stored in the `lua/` directory. All default plugin setups are called directly in the `init.lua` file.

This configuration is mainly setup for `Python`, `Svelte`, `Lua`, and `Go`.

# Installation

1. Just clone or link the `nvim` directory to your `$XDG_CONFIG_HOME`.

2. Check `lua/settings.lua` and `lua/config/` to see if the defaults is to your liking.

3. Run `:lua require("plugins")`.

# Features

Plugins management with [packer.nvim](https://github.com/wbthomason/packer.nvim)
FileType management with [filetype.nvim](https://github.com/nathom/filetype.nvim)

Very rudimentary file type specific code runner based on `ftplugin`, `filetype.nvim` and `whichkey`. For more complex commands create a `Makefile` (that's what I use) in the root directory (where `.git` is) and launch [greyjoy](https://github.com/desdic/greyjoy.nvim/) by pressing `<leader>l`, leader is space.

Catppuccin color scheme.

List of plugins used can be seen at `lua/plugins.lua`.

# Screenshots

![init file with nvimtree open](./init.png)

![lazygit opened in toggleterm](./lg.png)
