local M = {}

M.settings = {
	Lua = {
		diagnostics = {
			globals = { "vim" },
		},
		hint = { enable = true, arrayIndex = "Disable" },
	},
}

return M
