local base = require("plugins.configs.lspconfig")


local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({})

lspconfig.clangd.setup({
  on_attach = function (client,bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(
      client,
      bufnr
    )
  end,
  capabilities = capabilities,
})

lspconfig.zls.setup({
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true
      }
    }
  }
})
