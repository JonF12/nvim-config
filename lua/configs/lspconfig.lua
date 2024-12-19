-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

vim.filetype.add({ extension = { templ = "templ" } })

--todo : move each to its own folder for simpler organization
--
-- lsps with default config
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "jsonls",
  "yamlls",
  "templ",
}

-- default setup for multiple servers
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

lspconfig.tailwindcss.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {
    "templ",
    "javascript",
    "typescript",
    "react",
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "svelte",
  },
  init_options = {
    userLanguages = {
      templ = "html",
    },
  },
  root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "postcss.config.ts", "package.json", "node_modules", ".git"),
})

lspconfig.html.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "html" },
})
-- Emmet (wtf does this even do?)
lspconfig.emmet_ls.setup({
  capabilities = nvlsp.capabilities,
  filetypes = { "html", "css" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})
-- Custom server configurations
-- TypeScript/JavaScript with additional settings
-- todo: test/fix
lspconfig.ts_ls.setup({
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false,
  capabilities = nvlsp.capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
})
-- JSON with schema validation
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

-- YAML with schema store
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

lspconfig.denols.setup({
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

-- Configure gopls with auto-imports
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
      analyses = {
        unusedvariables = true,
        fieldalignment = true,
      },
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

lspconfig.sourcekit.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "swift" },
  cmd = { "sourcekit-lsp" },
})

lspconfig.omnisharp.setup({
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  filetypes = { "cs", "csproj", "sln" },
})
