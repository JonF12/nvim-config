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
  root_dir = lspconfig.util.root_pattern("tailwind.config.js", "postcss.config.js"),
})

lspconfig.html.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "html" },
})
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

require("configs.languages.c")
require("configs.languages.csharp")
require("configs.languages.go")
require("configs.languages.nix")
require("configs.languages.python")
