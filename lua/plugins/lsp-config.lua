return {
  {
    "WhoIsSethdaniel/mason-tool-installer",
    dependencies ={
      {      "williamboman/mason.nvim", opts = true},
      {"williamboman/mason-lspconfig.nvim", opts=true}
    },
    opts = {
      ensure_installed = {
        "pyright", -- LSP for python
        "ruff", -- Linter & formatter (includes flake8, pep8, black, isort, etc.)
        "debugpy", -- debugger
        "taplo", -- LSP for toml (e.g. for pyproject.toml files),
        "bashls",
        "cssls",
        "eslint",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "prismals",
        "tailwindcss"
      }
    }
  },
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
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		opts = {
			servers = {
				lua_ls = {},
				volar = { "vue" },
        pyright = {},
        ruff = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
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
			-- 	local servers = {
			-- 		lua_ls = {},
			-- 		volar = { "vue" },
			-- 	}
			-- 	local ensure_installed = vim.tbl_keys(servers)
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
