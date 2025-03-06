-- Dolny taskbar

local codestats = require 'codestats'

local xp = function()
  return codestats.get_xp(0)
end

return {
	"nvim-lualine/lualine.nvim",

	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
				globalstatus = vim.o.laststatus == 3,
				disabled_filetypes = {
					statusline = {
						"dashboard",
						"alpha",
						"snacks_dashboard",
					},
				},
			},
			sections = {
				lualine_y = {{
					xp,
					fmt = function(s)
						return s and s .. " xp"
					end,
				}},
			},

			extensions = {
				"neo-tree",
				"lazy",
				"fzf",
			},
		})
	end,
}
