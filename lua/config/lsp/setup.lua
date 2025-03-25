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
})
