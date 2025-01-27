-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

vim.filetype.add({ extension = { templ = "templ" } })

lspconfig.jsonls.setup({
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    json = {
      validate = { enable = true },
    },
  },
})

lspconfig.yamlls.setup({
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
    },
  },
})

require("configs.languages.webdev")
require("configs.languages.c")
require("configs.languages.csharp")
require("configs.languages.go")
require("configs.languages.nix")
require("configs.languages.python")
