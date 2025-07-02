return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = false,
			integrations = {
				treesitter = true,
				telescope = true,
				which_key = true,
				neotree = true,
				cmp = true,
				gitsigns = true,
				lsp_trouble = true,
				mason = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
