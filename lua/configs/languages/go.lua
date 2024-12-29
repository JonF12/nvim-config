local lspconfig = require("lspconfig")
-- local nvlsp = require("nvchad.configs.lspconfig")

lspconfig.gopls.setup({
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
  on_attach = function(client, bufnr)
    require("mappings.go_templ_mappings").go_format_on_save(client, bufnr)
  end,
})
