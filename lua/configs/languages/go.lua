local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

lspconfig.gopls.setup({
  cmd = { "gopls" },
  on_init = nvlsp.on_init,
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    require("mappings.go_templ_mappings").go_format_on_save(client, bufnr)
  end,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
      deepCompletion = true,
      experimentalPostfixCompletions = true,
      completionDocumentation = true,
      completeUnimported = true,
      importShortcut = "Both",
      diagnosticsDelay = "500ms",
      matcher = "fuzzy",
      symbolMatcher = "fuzzy",
      symbolStyle = "dynamic",
      templateExtensions = { "templ", "gotmpl" },
      directoryFilters = {
        "-node_modules",
        "-dist",
      },
    },
  },
  filetypes = { "go", "templ" },
})

lspconfig.templ.setup({
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})
