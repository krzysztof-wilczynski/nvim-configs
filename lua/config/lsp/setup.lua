local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({ ui = { border = "rounded" } })

local lsp_common = require("config.lsp.common")
local capabilities = lsp_common.get_capabilities()

mason_lsp.setup({
  ensure_installed = {
    "lua_ls", "yamlls", "dockerls", "basedpyright", "ruff", "djlsp",
    -- Vue/Frontend
    "vue_ls", "ts_ls", "cssls", "eslint",
  },
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

    -- Vue/Frontend
    ["vue_ls"] = function()
      local vue_config = require("config.lsp.servers.vue_ls")
      require("lspconfig").vue_ls.setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,
        settings = vue_config.settings,
        filetypes = vue_config.filetypes,
      })
    end,

    ["ts_ls"] = function()
      local ts_config = require("config.lsp.servers.ts_ls")
      require("lspconfig").ts_ls.setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,
        init_options = ts_config.init_options,
        filetypes = ts_config.filetypes,
        settings = ts_config.settings,
      })
    end,

    ["cssls"] = function()
      local css_config = require("config.lsp.servers.cssls")
      require("lspconfig").cssls.setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,
        settings = css_config.settings,
        filetypes = css_config.filetypes,
      })
    end,

    ["eslint"] = function()
      local eslint_config = require("config.lsp.servers.eslint")
      require("lspconfig").eslint.setup({
        on_attach = lsp_common.on_attach,
        capabilities = capabilities,
        handlers = lsp_common.handlers,
        settings = eslint_config.settings,
        filetypes = eslint_config.filetypes,
      })
    end,
  }
})
