return {
	{
		"pmizio/typescript-tools.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
		config = function()
			require("typescript-tools").setup({
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
				},
				settings = {
					tsserver_plugins = {
						"@vue/typescript-plugin",
					},
					jsx_close_tag = {
						enable = true,
						filetypes = { "javascriptreact", "typescriptreact" },
					},
				},
			})
		end,
	},
	{
		-- As soon as this plugin detects you're trying to use template strings (adding ${}) the quotes will be changed to backticks
		"axelvc/template-string.nvim",
		event = "InsertEnter",
		ft = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		config = true, -- run require("template-string").setup()
	},
	{
		-- A Neovim port of Matt Pocock's ts-error-translator for VSCode for turning messy and confusing TypeScript errors into plain English.
		"dmmulroy/ts-error-translator.nvim",
		config = true,
	},
}
