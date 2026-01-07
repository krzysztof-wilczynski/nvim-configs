local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({ ui = { border = "rounded" } })

local lsp_common = require("config.lsp.common")
local capabilities = lsp_common.get_capabilities()

mason_lsp.setup({
  ensure_installed = { "lua_ls", "yamlls", "dockerls" },
  automatic_installation = true,
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,
      })
    end,

    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,

        settings = require("config.lsp.servers.lua_ls").settings
      })
    end,

    ["yamlls"] = function()
      require("lspconfig").yamlls.setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,

        settings = require("config.lsp.servers.yamlls").settings
      })
    end,

    ["dockerls"] = function()
      require("lspconfig").dockerls.setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,

        settings = require("config.lsp.servers.dockerls").settings
      })
    end,

    ["rust_analyzer"] = function() end,
  }
})
