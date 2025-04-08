local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({
	ui = {
		border = "rounded",
	},
})

mason_lsp.setup({
	ensure_installed = {
		"lua_ls",
		"bashls",
		"cssls",
		"eslint",
		"html",
		"jsonls",
	},

	automatic_installation = true,
})

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		silent = true,
		border = "rounded",
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	}),
}

local capabilities = require("blink.cmp").get_lsp_capabilities()

local function on_attach(_, bufnr)
	vim.lsp.inlay_hint.enable(true, { bufnr })
end

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = handlers,
		})
	end,

	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = on_attach,
			settings = require("config.lsp.servers.lua_ls").settings,
		})
	end,

	["ts_ls"] = function()
		require("typescript-tools").setup({
			capabilities = capabilities or vim.lsp.protocol.make_client_capabilities(),
			handlers = require("config.lsp.servers.tsserver").handlers,
			on_attach = require("config.lsp.servers.tsserver").on_attach,
			settings = require("config.lsp.servers.tsserver").settings,
		})
	end,

	["cssls"] = function()
		lspconfig.cssls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = require("config.lsp.servers.cssls").on_attach,
			settings = require("config.lsp.servers.cssls").settings,
		})
	end,

	["eslint"] = function()
		lspconfig.eslint.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = require("config.lsp.servers.eslint").on_attach,
			settings = require("config.lsp.servers.eslint").settings,
			flags = {
				allow_incremental_sync = false,
				debounce_text_changes = 1000,
				exit_timeout = 1500,
			},
		})
	end,

	["jsonls"] = function()
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = on_attach,
			settings = require("config.lsp.servers.jsonls").settings,
		})
	end,

	["vuels"] = function()
		lspconfig.vuels.setup({
			filetypes = require("config.lsp.servers.vuels").filetypes,
			handlers = handlers,
			init_options = require("config.lsp.servers.vuels").init_options,
			on_attach = require("config.lsp.servers.vuels").on_attach,
			settings = require("config.lsp.servers.vuels").settings,
		})
	end,
})
