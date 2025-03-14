return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            {path = "${3rd}/luv/library", words = {"vim%.uv"}},
          }
        }
      }
		},

		config = function()
      vim.neovim
			local capabilities = require("blink.cmp").get_lsp_capabilities()
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = {
			{ "<leader>om", "<cmd>Mason<CR>", desc = "Mason" },
		},
		config = function()
			require("mason").setup()
			local servers = {
				lua_ls = {},
				volar = { "vue" },
			}
			local ensure_installed = vim.tbl_keys(servers)
		end,
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
