-- Dolny taskbar
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
			extensions = {
				"neo-tree",
				"lazy",
				"fzf",
			},
		})
	end,
}
