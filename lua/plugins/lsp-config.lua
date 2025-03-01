-- LSP - language server protocol, komunikacja pomiędzy serwerem języka a IDE
--
-- mason - interfejs do zarządzania serwerami LSP, DAP, linterami i formaterami

-- :h vim.lsp.buf

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
    opts = {
      auto_install = true
    }
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "<C-q>", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<C-b>", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
