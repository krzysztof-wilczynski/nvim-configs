local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({ ui = { border = "rounded" } })

local lsp_common = require("config.lsp.common")
local capabilities = lsp_common.get_capabilities()

mason_lsp.setup({
  ensure_installed = { "lua_ls", "yamlls", "dockerls", "basedpyright", "ruff", "djlsp" },
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

    ["basedpyright"] = function()
      require("lspconfig").basedpyright.setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,

        settings = require("config.lsp.servers.basedpyright").settings
      })
    end,

    ["ruff"] = function()
      local ruff_config = require("config.lsp.servers.ruff")
      require("lspconfig").ruff.setup({
        on_attach = function(client, bufnr)
          lsp_common.on_attach(client, bufnr)
          ruff_config.on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        handlers = lsp_common.handlers,
      })
    end,

    ["djlsp"] = function()
      local djlsp_config = require("config.lsp.servers.djlsp")
      require("lspconfig").djlsp.setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,
        root_dir = djlsp_config.root_dir,
        settings = djlsp_config.settings,
      })
    end,

    ["rust_analyzer"] = function() end,
  }
})
