require("neoscroll").setup()
local t = {}
for l = 1, 100 do
	t[string.format("%sk", l)] = { "scroll", { string.format("-%s", l), "true", "100" } }
	t[string.format("%sj", l)] = { "scroll", { string.format("%s", l), "true", "100" } }
end
require("neoscroll.config").set_mappings(t)
