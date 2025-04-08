return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- {
			-- 	"folke/lazydev.nvim",
			-- 	ft = "lua",
			-- 	opts = {
			-- 		library = {
			-- 			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			-- 		},
			-- 	},
			-- },
		},
		config = function()
			require("config.lsp.setup")
			require("config.lsp.functions")
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
	},
	{
		"antosha417/nvim-lsp-file-operations",
		event = "LspAttach",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-tree.lua" },
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
}
