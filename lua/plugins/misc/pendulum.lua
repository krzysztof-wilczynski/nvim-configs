-- Pendulum is a Neovim plugin designed for tracking time spent on projects with Neovim.

return {
	"ptdewey/pendulum-nvim",
	config = function()
		require("pendulum").setup({
			top_n = 10,
			hours_n = 10,
			time_format = "24h",
			time_zone = "Europe/Warsaw",
			report_excludes = {
				filetype = {
					"neo-tree",
					"snacks",
					"telescope",
				},
			},
		})
	end,
}
