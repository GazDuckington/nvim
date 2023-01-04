<div align="center">

![init.lua Init](./init.png)

</div>

# My Simple Neovim Configuration

This repos hosts my nvim configuration for Linux. Specific plugins configurations are stored in the `lua/config/` directory. While general configurations, like keybindings, color scheme, nvim options and the like, are stored in the `lua/core/` directory. All default plugin setups are called directly in the `plugins.lua` file.

This configuration is mainly setup for `Python`, `Svelte`, `Lua`, and `Go`.

# Installation

1. Just clone or link the `nvim` directory to your `$XDG_CONFIG_HOME`.

2. Check `lua/core/settings.lua` and `lua/config/` to see if the defaults is to your liking.

3. Run `:lua require("plugins")`.

List of plugins used can be seen at `lua/plugins.lua`.
