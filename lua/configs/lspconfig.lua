-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
local servers = { 
  "html", 
  "cssls",
  "ts_ls",        -- JavaScript/TypeScript (corrected from tsserver)
  "jsonls",       -- JSON
  "yamlls",       -- YAML
}

-- default setup for multiple servers
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "templ", "javascript", "typescript", "react", "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "svelte" },
  init_options = {
    userLanguages = {
      templ = "html"
    }
  },
  root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git'),
})

-- Emmet 
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "html", "templ", "css" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
})


-- Custom server configurations
-- TypeScript/JavaScript with additional settings
lspconfig.ts_ls.setup {
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
}

-- JSON with schema validation
lspconfig.jsonls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    json = {
      validate = { enable = true },
    },
  },
}

-- YAML with schema store
lspconfig.yamlls.setup {
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
}

lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"), 
}

-- Configure gopls with auto-imports
lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
      experimentalPostfixCompletions = true,
      -- Enable import organization
      importShortcut = "Both",
      -- Automatically add imports on file save
      analyses = {
        unusedvariables = true,
        unreachable = true,
      },
    },
  },
  -- Add code actions on save
  on_attach = function(client, bufnr)
    -- Enable format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
      end,
    })

    -- Set keymaps only for Go files
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  end,
})



-- Get Mason installation path for OmniSharp
local mason_path = vim.fn.stdpath "data" .. "/mason"
local omnisharp_cmd = mason_path .. "/bin/omnisharp.cmd"

-- OmniSharp setup with full path
local pid = vim.fn.getpid()
lspconfig.omnisharp.setup {
    cmd = { omnisharp_cmd, "--languageserver", "--hostPID", tostring(pid) },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    sdk_include_prereleases = true,
    analyze_open_documents_only = false,
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git")
}
