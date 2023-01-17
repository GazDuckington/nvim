# Installation

1. Just clone or link the `nvim` directory to your `$XDG_CONFIG_HOME`.

2. Check `lua/core/settings.lua` and `lua/config/` to see if the defaults is to your liking.

3. Run `:lua require("plugins")`.

List of plugins used can be seen at `lua/plugins.lua`.

For Bufpreview:

1. Go to the plugin' directory and run `deno task prepare`
2. Must be in markdown file' directory to run

_Note to self; check on [peek.nvim](https://github.com/toppair/peek.nvim), see if browser is supported_
